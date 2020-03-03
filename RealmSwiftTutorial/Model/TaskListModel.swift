//
//  TaskListModel.swift
//  RealmSwiftTutorial
//
//  Created by User23 on 2/3/2563 BE.
//  Copyright © 2563 Sirichai. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

final class TaskModel: Object, Comparable {
    
    @objc dynamic var id: String = ""
    @objc dynamic var text: String = ""
    @objc dynamic var completed: Bool = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    static func ==(lhs: TaskModel, rhs: TaskModel) -> Bool {
        return lhs.id == rhs.id
    }

    static func <(lhs: TaskModel, rhs: TaskModel) -> Bool {
        return lhs.id < rhs.id
    }
}
