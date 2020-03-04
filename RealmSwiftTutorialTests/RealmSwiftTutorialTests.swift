//
//  RealmSwiftTutorialTests.swift
//  RealmSwiftTutorialTests
//
//  Created by User23 on 3/3/2563 BE.
//  Copyright © 2563 Sirichai. All rights reserved.
//

import XCTest
@testable import RealmSwiftTutorial

class RealmSwiftTutorialTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        RealmDatabase.shareInstance.clear()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testStAddDataToDatabase() {
        let model = TaskModel(value: ["text": "test", "id": "1"])
        let addModelTest = RealmDatabase.shareInstance.save(object: model)
        XCTAssertTrue(addModelTest, "add first model is success")
    }
    
    func testNdAddDataToDatabase() {
        
        let model = TaskModel(value: ["text": "test2", "id": "2"])
        let addModelTest = RealmDatabase.shareInstance.save(object: model)
        XCTAssertTrue(addModelTest, "add second model is success web")
    }
    
    func testGetStDataFromDatabase() {
        let modelTest = TaskModel(value: ["text": "test", "id": "1"])
        guard let models = RealmDatabase.shareInstance.get(type: TaskModel.self) else { XCTFail(); return}
        var modelList: [TaskModel] = []
        for i in models {
            modelList.append(i)
        }
        XCTAssertEqual(models[0], modelTest, "get first data test")
    }
//
//    func testCountOfTask() {
//        let count = RealmDatabase.shareInstance.get(type: TaskModel.self)
//        XCTAssertEqual(2, count?.count ?? -1, "count of data in database is two")
//    }
//
//    func testEditNdData() {
//        let ndModel = RealmDatabase.shareInstance.get(type: TaskModel.self, key: "2")
//        let modelTest = TaskModel(value: ["text": "text edit", "id": "2"])
//
//        do {
//            try RealmDatabase.shareInstance.realm.write {
//                ndModel?.text = "text edit"
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
//
//        let newModelFromDb = RealmDatabase.shareInstance.get(type: TaskModel.self, key: "2")
//        XCTAssertEqual(newModelFromDb, modelTest, "Edit Data is success")
//
//    }
}
