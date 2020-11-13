//
//  ViewController.swift
//  Event-Attendance
//
//  Created by Masateru Maegawa on 2020/11/13.
//  Copyright © 2020 Masateru Maegawa. All rights reserved.
//

import UIKit

class GroupListViewController: UITableViewController {
    
    //アイテムの型
    class Item {
        var title: String
        var done: Bool = false
        init(title: String){
            self.title = title
        }
    }

    var itemArray: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NaviBarのタイトルを大きく表示される
    //    navigationController?.navigationBar.prefersLargeTitles = true
        
        
    }
    
    //セルの数を指定
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return itemArray.count
    }
    
    //セルのカスタマイズ
    override func tableView(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        return cell
    }
    
    //新規グループ追加機能
    @IBAction func addButtonPressed(_ sender: Any){
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "新しいグループを追加", message: "",preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "リストに追加", style: .default){ (action) in
            //リストに追加をした時に実行される処理
            
            let newItem: Item = Item(title: textField.text!)
            
            //アイテム追加処理
            self.itemArray.append(newItem)
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
        
    }
    
    //スワイプでのグループ削除機能
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        //アイテム削除処理
        itemArray.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
    }


}

