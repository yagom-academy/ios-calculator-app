//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Hemg on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    
    var sut: NumberQueue<Any>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = NumberQueue<Any>()
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
    
    func test_checkNumber_숫자가있는지() {
      
        let result = sut.checkItemEmpty()
        
        XCTAssertTrue(result)
    }
    
    func test_checkNumber_숫자가없는지() {
        let input = 39
        sut.enqueueItem(item: input)
        
        let result = sut.checkItemEmpty()
        
        XCTAssertFalse(result)
    }
    
    func test_itemIsvalid() {
        let input = 40
        
        sut.enqueueItem(item: input)
        let dequeuedItem = sut.dequeueItem()
        
        XCTAssertEqual(input, dequeuedItem as! Int)
    }
    
    func test_dequeueItem() {
        let firstInput = [1, 2, 3]
        let secondInput = [1, 2, 3]
        
        sut.enqueueItem(item: firstInput)
        sut.enqueueItem(item: secondInput)
        
        let dequeuedFirst = sut.dequeueItem()
        let dequeuedSecond = sut.dequeueItem()
        
        XCTAssertEqual(dequeuedFirst as! [Int], firstInput)
        XCTAssertEqual(dequeuedSecond as! [Int], secondInput)
        XCTAssertTrue(sut.checkItemEmpty())
    }
}

