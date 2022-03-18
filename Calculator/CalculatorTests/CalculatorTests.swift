//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 고명주 on 2022/03/18.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    private var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.setUpWithError()
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
    
    func test_LinkedListNode가_비었을때_isEmpty가_true를_리턴하는가() {
        
        let result = sut.isEmpty()
        
        XCTAssertTrue(result)
    }

}
