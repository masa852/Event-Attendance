//
//  ViewController.swift
//  Event-Attendance
//
//  Created by Masateru Maegawa on 2020/11/13.
//  Copyright © 2020 Masateru Maegawa. All rights reserved.
//

import UIKit
import RealmSwift

class GroupListViewController: UITableViewController {
    
    let newGroup = GroupModel()
    var groupItem: Results<GroupModel>!
    
    @IBOutlet var groupTableView: UITableView!
    
    // グループ名追加処理
    @IBAction func tapAddButton(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "新しいグループを追加", message: "",preferredStyle: .alert)
        let addAction = UIAlertAction(title: "リストに追加", style: .default){ (action) in
        //リストに追加をした時に実行される処理
        self.newGroup.title = textField.text!
        do{
        try uiRealm.write({ () -> Void in
            uiRealm.add(self.newGroup)
            print(Realm.Configuration.defaultConfiguration.fileURL!)
            self.groupTableView.reloadData()
            print("Todo Saved")
            })
        }catch{
            print("Save is Failed")
        }
                  
        //アイテム追加処理
        //self.itemArray.append(newItem)
        //self.tableView.reloadData()
                  
            }
              
              let cancelAction = UIAlertAction(title: "キャンセル", style: .default){ (action) in
                  self.dismiss(animated: true, completion: nil)
              }
                  
                  
              
              alert.addTextField{ (alertTextField) in
                  alertTextField.placeholder = "グループ名"
                  textField = alertTextField
    }

    alert.addAction(addAction)
    alert.addAction(cancelAction)
    present(alert, animated: true, completion: nil)
        

}


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //DBに保存されたデータの取り出し
        do{
            groupItem = uiRealm.objects(GroupModel.self)
            groupTableView.reloadData()
        }catch{
            
        }
    }
      
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupTableView.reloadData()
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
            //groupItemの数=セルの数
            return groupItem.count
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "GroupCell")
              
                  //todoGroupに代入されたデータをobject:NSArrayに代入
                  let object = groupItem[indexPath.row]
                  
                  //cellのtextLabel.textにobjectのtitleプロパティを代入
                  cell.textLabel?.text = object.title
                  
                  return cell
    }
    
    // TableViewのCellの削除を行った際に、Realmに保存したデータを削除する
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {


        if(editingStyle == UITableViewCell.EditingStyle.delete) {
            do{
                try uiRealm.write {
                    uiRealm.delete(self.groupItem[indexPath.row])
                }
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            }catch{
            }
            tableView.reloadData()
        }
    }
        
}

