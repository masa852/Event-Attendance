//
//  Member.swift
//  Event-Attendance
//
//  Created by Masateru Maegawa on 2020/11/29.
//  Copyright © 2020 Masateru Maegawa. All rights reserved.
//

import Foundation
import RealmSwift

class Member: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var furigana: String = ""
//    var parentGroup = LinkingObjects(fromType: Group.self, property: "members")
}
