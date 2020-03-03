//
//  PostListModel.swift
//  RealmSwiftTutorial
//
//  Created by User23 on 2/3/2563 BE.
//  Copyright © 2563 Sirichai. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class PostModel: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var text: String = ""
}
