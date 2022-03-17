//
//  ExpressionParserTest.swift
//  ModelTests
//
//  Created by Red on 2022/03/18.
//

import XCTest
@testable import Calculator

class ExpressionParserTest: XCTestCase {
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func test_componentsByOperators() {
        let expectResult = ["10", "+", "2", "-", "3", "×", "4"]
        let result = ExpressionParser.scroll.componentsByOperators(from: "10 + 2 - 3 × 4")
        XCTAssertEqual(result, expectResult)
    }

}
