//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 이호영 on 2021/11/12.
//

import XCTest

class ExpressionParserTests: XCTestCase {

    var queue: CalculatorItemQueue?
    
    override func setUpWithError() throws {
        queue = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        queue = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
