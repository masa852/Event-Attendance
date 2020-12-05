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
    var savegroup: Group?
//    var event: Event?
    
    
//    var selectedGroup: Group?{
//        didSet {
//            loadEvents()
//        }
//    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
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
        
//        DispatchQueue.global().async {
//            self.savegroup = self.appDelegate.selectgroup
////            self.group?.registmembers.append(self.member)
////            appDelegate.anothergroup? = self.group?.registmembers
//        }
        
            try! realm.write {
//                event = appDelegate.selectevent
                group = appDelegate.selectgroup
                member.name = nameTextField.text!
//                member.furigana = furiganaTextField.text!
                print(member)
 //               print(selectedGroup)
 //               let someDogs = realm.objects(Member.self).filter("name contains 'Fido'")
 //               currentGroup.members.append(objectsIn: someDogs)
 //               group.members.append(member)
                group?.registmembers.append(member)
                
                print(member)
                print(group?.registmembers)
//                event?.addmembers.append(group!.registmembers)
                
        }
    }
//}
}
