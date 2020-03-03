//
//  RealmDatabase.swift
//  RealmSwiftTutorial
//
//  Created by User23 on 2/3/2563 BE.
//  Copyright © 2563 Sirichai. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class RealmDatabase {
    
    static let shareInstance = RealmDatabase()
    
    var realm: Realm!
    
    init() {
        do {
            realm = try Realm()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func clear() {
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK - Create
    func save(object: Object) -> Bool {
        do {
            try self.realm.write {
                self.realm.add(object)
            }
             return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    // MARK - Read
    func get<T: Object>(type: T.Type) -> Results<T>? {
        return realm.objects(type)
    }
    
    func get<T: Object, K>(type: T.Type, key: K) -> T? {
        
        return realm.object(ofType: type, forPrimaryKey: key)
    }
    
    // MARK - Delete
    func delete(object: Object) -> Bool {
        do {
            try self.realm.write {
                self.realm.delete(object)
            }
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}
