//
//  RegistrationViewController.swift
//  Event-Attendance
//
//  Created by Masateru Maegawa on 2020/11/28.
//  Copyright © 2020 Masateru Maegawa. All rights reserved.
//

import UIKit
import RealmSwift

class RegistrationViewController: UIViewController {
//    var members: Results<Member>?
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var eventItem: Results<Event>?
    let member = Member()
    let realm = try! Realm()
    var group: Group?
//    var selectedGroup: Group?{
//        didSet {
//            loadEvents()
//        }
//    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
          var groups = realm.objects(Group.self)
            print(groups)
            print(group)
        }
    
//    func loadEvents() {
//        eventItem = selectedGroup?.events.sorted(byKeyPath: "title", ascending: true)
// //       var eventcount = eventItem?.count
//
//    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var furiganaTextField: UITextField!
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
//        let agroup = realm.objects(Group.self)//.filter("ii")
//        if let currentGroup = self.selectedGroup {
            try! realm.write {
                group = appDelegate.selectgroup
                member.name = nameTextField.text!
                member.furigana = furiganaTextField.text!
                print(member)
 //               print(selectedGroup)
 //               let someDogs = realm.objects(Member.self).filter("name contains 'Fido'")
 //               currentGroup.members.append(objectsIn: someDogs)
 //               group.members.append(member)
                group?.registmembers.append(member)
        }
    }
//}
}
