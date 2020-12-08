//
//  AttendanceTabMainView.swift
//  
//
//  Created by Masateru Maegawa on 2020/12/05.
//

import UIKit
import RealmSwift
import XLPagerTabStrip

class AttendanceTabMainViewController: UIViewController, IndicatorInfoProvider {    // 「IndicatorInfoProvider」を追加
    
    // タブのタイトルを設定
    var itemInfo: IndicatorInfo = "出欠"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
  
    ////    var event : Event?
        var group : Group?
        let realm = try! Realm()
        var member : List<Member>?
        var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    //    var selectMember : List<SelectMember>?
    
    //    override func viewWillAppear(_ animated: Bool) {
     
    //        print(group)
    //        print(group?.registmembers)
    //      //  selectMember? = group?.registmembers as! List<SelectMember>

    //        member? = group?.registmembers as! List<Member>
    //       // print(selectedEvent)
    
    override func viewDidAppear(_ animated: Bool) {
        
//    group = appDelegate.selectgroup
    // グループに登録されているメンバー一覧の値を取り出し
//    var selectedEvent = appDelegate.selectevent
//    let registMembers = group?.registmembers
    
//    try! realm.write {
//        // forEach で `List<Member>` の要素分ループを回し、`SelectMember` に変換して追加
//        registMembers?.forEach { member in
//            // `SelectMember` に変換
//            // 以下の部分は少し冗長なので `Member` に変換用のメソッドを持たせてもいいと思います.
//            let selectMember = SelectMember()
//            selectMember.name = member.name
//            selectMember.furigana = member.furigana
//            selectMember.done = member.done
//            selectMember.gender = member.gender
//            print(selectMember)
//            print(selectedEvent)
//
//            // 変換した `SelectMember` を `append()` で追加
//            selectedEvent?.addmembers.append(selectMember)
//       }
//    }
    
    // //       DispatchQueue.global().async {
    ////            selectedEvent?.addmembers = group?.registmembers as! List<SelectMember>
    ////          print(selectedEvent?.addmembers)
    // //       selectMember? = selectedEvent?.addmembers as! List<SelectMember>
    // //       print(selectMember)
    ////        print(event!.addmembers)
    //            try! realm.write {
    // //           event.addmembers = selectedEvent?.addmembers as! List<Member>
    // //           member? = group?.registmembers as! List<Member>
    // //               realm.add(event)
    // //               selectedEvent?.addmembers.append(selectMember)
    //
    // //               selectedEvent?.addmembers.append(member)
    ////        }
    //
    //    }
    //
    //}
    }
    
}
