//
//  ExpressionParserTests.swift
//  CalculatorItemsTests
//
//  Created by 이경민 on 2022/09/25.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    func test_parse를후결과가정상적으로도출되는지() {
        // driven
        let formula = ExpressionParser.parse(from: "1+2")
        
        // when
        let calResult = formula.result()
        
        // then
        XCTAssertEqual(calResult, 3)
    }
}
