//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by 임지성 on 2021/11/11.
//

import XCTest

class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParser.Type!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ExpressionParser.self
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
