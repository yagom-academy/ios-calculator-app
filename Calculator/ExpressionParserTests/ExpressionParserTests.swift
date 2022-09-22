//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by jin on 9/22/22.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {

    func test_split_string_to_components_by_operators() throws {
        let input = "3+42-7÷32"
        
        let result = ExpressionParser.componentsByOperators(from: input)
        
        
        XCTAssertEqual(result, ["3", "+", "42", "-", "7", "÷", "32"])
    }

}
