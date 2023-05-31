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
    
    func test_enqueue숫자() {
        let firstInput = 1
        let secondInput = 2
        let thirdInput = 3
        
        sut.enqueueItem(item: firstInput)
        sut.enqueueItem(item: secondInput)
        sut.enqueueItem(item: thirdInput)
        
        let result = sut.dequeue()
        let result1 = sut.dequeue()
        let result2 = sut.dequeue()
        
        XCTAssertEqual(result, firstInput)
        XCTAssertEqual(result1, secondInput)
        XCTAssertEqual(result2, thirdInput)
  
    }
        
}
