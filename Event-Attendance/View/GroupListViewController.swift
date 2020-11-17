//
//  ViewController.swift
//  Event-Attendance
//
//  Created by Masateru Maegawa on 2020/11/13.
//  Copyright © 2020 Masateru Maegawa. All rights reserved.
//

import UIKit
/*
class GroupListViewController: UITableViewController {
    
    let newGroup = GroupModel()
    var groupItem: Results<GroupModel>!
    
    
    @IBAction func tapAddButton(_ sender: Any) {
        
        var textField = UITextField()
              
        let alert = UIAlertController(title: "新しいグループを追加", message: "",preferredStyle: .alert)
              
        let addAction = UIAlertAction(title: "リストに追加", style: .default){ (action) in
        //リストに追加をした時に実行される処理
                  
//            let newGroup.text = textField.text!
                  
        //アイテム追加処理
        //self.itemArray.append(newItem)
        self.tableView.reloadData()
                  
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
    
    
    do{
        let realm = try Realm()
    try realm.write({ () -> Void in
        realm.add(newGroup)
        print("Todo Saved")
        })
    }catch{
        print("Save is Failed")
    }
}

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //DBに保存されたデータの取り出し
        do{
            let realm = try Realm()
            groupItem = realm.objects(GroupModel.self)
            tableView.reloadData()
        }catch{
            
        }
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
            //gourpItemの数=セルの数
            return groupItem.count
        }
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexpath: NSIndexPath)->UITableViewCell{
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "GroupCell")
        
            //todoGroupに代入されたデータをobject:NSArrayに代入
            let object = groupItem[indexpath.row]
            
            //cellのtextLabel.textにobjectのtitleプロパティを代入
            cell.textLabel?.text = object.title
            
            return cell
            
        }
        
        
}
*/
