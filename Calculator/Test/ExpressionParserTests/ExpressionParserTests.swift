//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by kaki on 2023/01/27.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    func test_5_더하기_10_곱하기_4_나누기_6_빼기_15는_마이너스5인가() {
        // given
        let input = "5 + 10 × 4 ÷ 6 − 15"
        let expectation = -5.0
        // when
        var parseTest = ExpressionParser.parse(from: input)
        let result = parseTest.result()
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_5_빼기_마이너스8은_13인가() {
        // given
        let input = "5 − -8"
        let expectation = 13.0
        // when
        var parseTest = ExpressionParser.parse(from: input)
        let result = parseTest.result()
        // then
        XCTAssertEqual(result, expectation)
    }
}
