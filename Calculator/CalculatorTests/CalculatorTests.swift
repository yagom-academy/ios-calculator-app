//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Hemg on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    
    var sut: NumberItemLinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = NumberItemLinkedList<Int>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_EnqueueItem_숫자확인() {
        sut.enqueueItem(item: 1)
        sut.enqueueItem(item: 2)
        sut.enqueueItem(item: 3)
        
        XCTAssertEqual(sut.checkFirstItem(), 1)
    }
    
    func test_DequeueItem_지운숫자() {
        sut.enqueueItem(item: 1)
        sut.enqueueItem(item: 2)
        sut.enqueueItem(item: 3)
        
        let dequeuedItem = sut.dequeueItem()
        XCTAssertEqual(dequeuedItem, 1)
        
        let newFirstItem = sut.checkFirstItem()
        XCTAssertEqual(newFirstItem, 2)
    }
    
    func test_ContainsItem_숫자확인() {
        sut.enqueueItem(item: 1)
        sut.enqueueItem(item: 2)
        sut.enqueueItem(item: 3)
        
        XCTAssertTrue(sut.checkContainsItem(2))
        XCTAssertFalse(sut.checkContainsItem(4))
    }
    
    func testContainsItem_배열테스트() {
        let items = [1, 2, 3]
        
        for item in items {
            sut.enqueueItem(item: item)
        }
        
        XCTAssertTrue(sut.checkContainsItem(2))
        XCTAssertFalse(sut.checkContainsItem(4))
    }
    
}
