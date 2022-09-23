//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 이정민 on 2022/09/23.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    
    func test_When_generate_parse_Then_expect_Not_nil() {
        // given
        let testString = "1+2+3"
        
        // when
        let result = ExpressionParser.parse(from: testString)
        
        // then
        XCTAssertNotNil(result)
    }
}
