import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase


class LoginViewController: UIViewController , LoginButtonDelegate{
    

    let fbLoginButton: FBLoginButton = FBLoginButton()
    var displayName = String()
    var pictureURL = String()
    var pictureURLString = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        fbLoginButton.delegate = self
        fbLoginButton.frame = CGRect(x: view.frame.size.width / 2 - view.frame.size.width / 4, y: view.frame.size.height / 4, width: view.frame.size.width / 2, height: 30)

        //許可するもの
        fbLoginButton.permissions = ["public_profile, email"]

        view.addSubview(fbLoginButton)

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

 /     //ここからfirebase
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
            let nextVC = self.storyboard?.instantiateViewController(identifier: "next") as! NextViewController
            self.navigationController?.pushViewController(nextVC, animated: true)

        }



       }

    func loginButtonWillLogin(_ loginButton: FBLoginButton) -> Bool {
        return true
    }
       func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
           //ログアウト
       }



}
