
import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit
import GoogleSignIn

class LoginViewController: UIViewController , LoginButtonDelegate{
    
    @IBOutlet var signInButton: GIDSignInButton!

    let fbLoginButton: FBLoginButton = FBLoginButton()
    var displayName = String()
    var pictureURL = String()
    var pictureURLString = String()
    var handle: AuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()

        fbLoginButton.delegate = self
        fbLoginButton.frame = CGRect(x: view.frame.size.width / 2 - view.frame.size.width / 4, y: view.frame.size.height / 4, width: view.frame.size.width / 2, height: 30)

        //許可するもの
        fbLoginButton.permissions = ["public_profile, email"]

        view.addSubview(fbLoginButton)
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()

    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //ナビゲーションバーを消す
        navigationController?.isNavigationBarHidden = true
    }
        

    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
           //loginする
        if error == nil{
            if result?.isCancelled == true{
                //キャンセルされた場合は何もしないで返す
                return
            }
        }

        let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
        
        //ここからfirebase
        Auth.auth().signIn(with: credential) { (result, error) in
            if let error = error {
                return
            }
            self.displayName = (result?.user.displayName)!
            //string型に強制変換
            self.pictureURLString = (result?.user.photoURL!.absoluteString)!
            //画像の大きさを変更（大きくした）
            self.pictureURLString = self.pictureURLString + "?type=large"

            //次の画面遷移で画像を表示させるために、userdefaultを用いて保存＆ログイン保持
            let ud = UserDefaults.standard
            ud.set(1, forKey: "loginOK") //ログイン保持
            ud.set(self.pictureURLString, forKey: "pictureURLString")

            //次の画面の遷移先を指定
            //let nextVC = self.storyboard?.instantiateViewController(identifier: "next") as! NextViewController
            //self.navigationController?.pushViewController(nextVC, animated: true)

        }

       }

    func loginButtonWillLogin(_ loginButton: FBLoginButton) -> Bool {
        return true
    }
       func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
           //ログアウト
       }
    
    
    // signIn:didSignInForUser:withError: メソッドで、Google ID トークンと Google アクセス トークンを GIDAuthentication オブジェクトから取得して、Firebase 認証情報と交換します。
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
      if let error = error {
        return
      }

      guard let authentication = user.authentication else { return }
      let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                        accessToken: authentication.accessToken)
      // ...
    }
    

}

/*
import UIKit
import Firebase
import FirebaseUI

class LoginViewController: UIViewController,FUIAuthDelegate {


    @IBOutlet weak var authButton: UIButton!
    
    
    var authUI: FUIAuth { get { return FUIAuth.defaultAuthUI()!}}
    // 認証に使用するプロバイダの選択
    let providers: [FUIAuthProvider] = [
        FUIGoogleAuth(),
        FUIFacebookAuth(),
        FUIEmailAuth()
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // authUIのデリゲート
        self.authUI.delegate = self
        self.authUI.providers = providers
        authButton.addTarget(self,action: #selector(self.authButtonTapped(sender:)),for: .touchUpInside)
    }

    @objc func authButtonTapped(sender : AnyObject) {
        // FirebaseUIのViewの取得
        let authViewController = self.authUI.authViewController()
        // FirebaseUIのViewの表示
        self.present(authViewController, animated: true, completion: nil)
    }

    //　認証画面から離れたときに呼ばれる（キャンセルボタン押下含む）
    public func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?){
        // 認証に成功した場合
        if error == nil {
            self.performSegue(withIdentifier: "toNextView", sender: nil)
        } else {
        //失敗した場合
            print("error")
        }
    }
}
*/
