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
//    var eventItem: Results<Event>?
   
    let realm = try! Realm()
    var group: Group?
    var selectedEvent: Event?
//    var savegroup: Group?
//    var event: Event?
    
    
//    var selectedGroup: Group?{
//        didSet {
//            loadEvents()
//        }
//    }
    
        override func viewDidLoad() {
            super.viewDidLoad()

//            let teams = realm.objects(Event.self).filter("title = '12/12'").first
//            let results = teams?.addmembers.filter("name == 'ishida'")
//            print(teams)
//            print(results)
//            try! realm.write {
////                teams.setValue(true, forKey: "addmembers.done")
//                
//                results?.setValue(true, forKey: "done")
////                results.done = true
//            }

        }
    
//    func loadEvents() {
//        eventItem = selectedGroup?.events.sorted(byKeyPath: "title", ascending: true)
// //       var eventcount = eventItem?.count
//
//    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var furiganaTextField: UITextField!
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let member = Member()
        let selectmember = SelectMember()
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
                print(group)
                member.name = nameTextField.text!
                selectmember.name = nameTextField.text!
//                member.furigana = furiganaTextField.text!
 //               print(selectmember)
                print(member)
 //               print(selectedGroup)
 //               let someDogs = realm.objects(Member.self).filter("name contains 'Fido'")
 //               currentGroup.members.append(objectsIn: someDogs)
 //               group.members.append(member)
                group?.registmembers.append(member)
                
                selectedEvent = appDelegate.selectevent
//                print(selectedEvent)
//      //          var registMembers = group?.registmembers
                selectedEvent?.addmembers.append(selectmember)
//                event?.addmembers.append(group!.registmembers)
                nameTextField.text = ""
                
        }
    }
//}
}
