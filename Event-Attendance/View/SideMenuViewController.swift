//
//  SideMenuViewController.swift
//  Event-Attendance
//
//  Created by Masateru Maegawa on 2020/11/28.
//  Copyright © 2020 Masateru Maegawa. All rights reserved.
//

import UIKit
import SideMenu


class SideMenuViewController: UITableViewController {

    var items = ["メンバー登録","設定"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 0{
//            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                   // 遷移先ViewControllerのインスタンス取得
//                   let firstView = storyboard.instantiateViewController(withIdentifier: "RegistrationView") as! RegistrationViewController
//                    firstView.modalPresentationStyle = .fullScreen
//            
//                   // 画面遷移
//                   self.present(firstView, animated: true, completion: nil)
//            // セルの選択を解除
//            tableView.deselectRow(at: indexPath, animated: true)
//        } else {
//            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//
//                   let secondView = storyboard.instantiateViewController(withIdentifier: "SettingView") as! SettingViewController
//                    secondView.modalPresentationStyle = .fullScreen
//                    self.present(secondView, animated: true, completion: nil)
//           
//            tableView.deselectRow(at: indexPath, animated: true)
//            
//        }
//    }
}
