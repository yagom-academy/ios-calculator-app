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
        let expectResult = ["10", "+", "2", "-", "3", "×", "4"]
        let formula = ExpressionParser.parse(form: "10 + 2 - 3 × 4")
        
        let result_operands = formula.operands
        let result_operators = formula.operators
        
        
        XCTAssertEqual(result, expectResult)
    }

}
