//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 1 on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
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
    
    func test_item() {
        let input = 40
        
        sut.enqueueItem(item: input)
        let dequeuedItem = sut.dequeue()
        
        XCTAssertEqual(input, dequeuedItem)
    }

}
