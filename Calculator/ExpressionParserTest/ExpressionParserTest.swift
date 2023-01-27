//  ExpressionParserTest.swift
//  Created by 레옹아범 on 2023/01/27.

import XCTest
@testable import Calculator

final class ExpressionParserTest: XCTestCase {
    func test_1더하기2의_문자열이_parse한_Formula의_result값은_3이다() {
        // given
        var formula = ExpressionParser.parse(from: "1 + 2")
        let exception: Double = 3
        // when
        let result = formula.result()
        // then
        XCTAssertEqual(result, exception)
    }
    
    func test_1더하기2곱하기3빼기1의_문자열을_parse한_Formula의_result값은_8이다() {
        // given
        var formula = ExpressionParser.parse(from: "1 + 2 * 3 - 1")
        let exception: Double = 8
        // when
        let result = formula.result()
        // then
        XCTAssertEqual(result, exception)
    }
    
    func test_1빼기음수1의_문자열을_parse한_Formula의_result값은_2이다() {
        // given
        var formula = ExpressionParser.parse(from: "1 - -1")
        let exception: Double = 2
        // when
        let result = formula.result()
        // then
        XCTAssertEqual(result, exception)
    }
    
    func test_1콤마000더하기1의_문자열을_parse한_Formula의_result값은_1001이다() {
        // given
        var formula = ExpressionParser.parse(from: "1,000 + 1")
        let exception: Double = 1001
        // when
        let result = formula.result()
        // then
        XCTAssertEqual(result, exception)
    }
}
