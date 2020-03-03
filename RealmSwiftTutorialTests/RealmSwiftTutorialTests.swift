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
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCountOfTask() {
        let count = RealmDatabase.shareInstance.get(type: TaskModel.self)?.count
        XCTAssertEqual(count, 4, "")
    }
}
