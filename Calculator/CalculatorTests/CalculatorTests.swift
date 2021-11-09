//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 김진태 on 2021/11/08.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {

    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testCountIsZeroWhenQueueDidNothing() {
        let expectedCount = 0
        XCTAssertEqual(sut.count, expectedCount)
    }
    
    func testCountIsOneAfterInsertMethodCalledOnce() {
        sut.insert(1)
        let expectedCount = 1
        XCTAssertEqual(sut.count, expectedCount)
    }
    
    func testCountIsValidWhenInsertAndDeleteMethodCalledMultipleTimes() {
        var insertCount = 0
        var deleteCount = 0
        
        repeatInsert(times: 5)
        repeatDelete(times: 4)
        repeatInsert(times: 6)
        repeatDelete(times: 4)
        
        let expectedCount = insertCount - deleteCount
        XCTAssertEqual(sut.count, expectedCount)
        
        func repeatInsert(times: Int) {
            for _ in 0..<times {
                let randomNumber = Int.random(in: 0...259)
                insertCount += 1
                sut.insert(randomNumber)
            }
        }
        
        func repeatDelete(times: Int) {
            for _ in 0..<times {
                let deleteResult = sut.delete()
                if deleteResult != nil { deleteCount += 1 }
            }
        }
    }
    
    func testInsertItemSucceeded() {
        let insertItem = 6
        sut.insert(insertItem)
        let isSuccess = sut.front == insertItem
        XCTAssertTrue(isSuccess)
    }
    
    func testFrontAndRearIsSameWhenQueueIsEmtyOrQueueCountIsOne() {
        XCTAssertEqual(sut.front, sut.rear)
        
        let insertItem = 66
        sut.insert(insertItem)
        
        XCTAssertEqual(sut.front, sut.rear)
    }
    
    func testFrontAndRearIsDifferentWhenQueueCountIsMoreThanTwo() {
        sut.insert(3)
        sut.insert(5)
        
        XCTAssertNotEqual(sut.front, sut.rear)
        
        sut.insert(7)
        sut.insert(9)
        
        XCTAssertNotEqual(sut.front, sut.rear)
    }
    
    func testDeleteItemFailedWhenQueueIsEmpty() {
        let result = sut.delete()
        let isFail = (result == nil)
        XCTAssertTrue(isFail)
    }
    
    func testInsertAndDeleteItemSucceeded() {
        let item = 6
        sut.insert(item)
        let deleteResult = sut.delete()
        let isDeleteSuccess = (deleteResult == item)
        XCTAssertTrue(isDeleteSuccess)
    }
    
    func testIsEmptyPropertyIsTrueWhenQueueDidNothing() {
        XCTAssertTrue(sut.isEmpty)
    }
    
    func testIsEmptyPropertyIsFalseWhenInsertMethodCalledOnce() {
        sut.insert(6)
        XCTAssertFalse(sut.isEmpty)
    }
    
    func testIsEmptyPropertyIsFalseWhenInsertMethodCalledFiveTimesAndDeleteMethodCalledThreeTimes() {
        [3,6,9,-6,2].forEach { insertNumber in
            sut.insert(insertNumber)
        }
        (0..<3).forEach { _ in
            sut.delete()
        }
        XCTAssertFalse(sut.isEmpty)
    }
    
    func testIsEmptyPropertyIsTrueWhenInsertMethodCalledFiveTimesAndDeleteMethodCalledSixTimes() {
        [3,6,9,-6,2].forEach { insertNumber in
            sut.insert(insertNumber)
        }
        (0..<6).forEach { _ in
            sut.delete()
        }
        XCTAssertTrue(sut.isEmpty)
    }

    func testClearMethodExcutedProperlyAfterInsertMethodCalledFiveTimes() {
        [3,6,9,-6,2].forEach { insertNumber in
            sut.insert(insertNumber)
        }
        sut.clear()
        XCTAssertTrue(sut.isEmpty)
    }
    
}
