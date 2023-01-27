//  ExpressionParserTest.swift
//  Created by 레옹아범 on 2023/01/27.

import XCTest
@testable import Calculator

final class ExpressionParserTest: XCTestCase {
    func test_1더하기2의_문자열이_parse한_Formula의_result값은_3이다() {
        var formula = ExpressionParser.parse(from: "1+2")
        let result = formula.result()
        XCTAssertEqual(result, 3)
    }
    
    func test_1더하기2곱하기3빼기1의_문자열을_parse한_Formula의_result값은_8이다() {
        var formula = ExpressionParser.parse(from: "1+2*3-1")
        let result = formula.result()
        XCTAssertEqual(result, 8)
    }
}
