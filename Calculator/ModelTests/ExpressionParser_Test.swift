//
//  ExpressionParserTest.swift
//  ModelTests
//
//  Created by Red on 2022/03/18.
//

import XCTest
@testable import Calculator

class ExpressionParser_Test: XCTestCase {
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func test_componentsByOperators() {
        var formula = ExpressionParser.parse(form: "10 + 2 - 3 × 4")
        
        let result = formula.result()
        
        XCTAssertEqual(result, 36.0)
    }

}
