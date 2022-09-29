//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Hamo on 2022/09/26.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    func testParse_한종류의연산자와양수피연산자문자열이입력됐을때_반환된Formula의result값이_문자열의계산결과와동일해야한다() {
        // given
        let input = "1+2+3+4"
        // when
        var result = ExpressionParser.parse(from: input)
        // then
        XCTAssertEqual(try result.result(), 10)
    }
    
    func testParse_두종류이상의연산자와양수피연산자문자열이입력됐을때_반환된Formula의result값이_문자열의계산결과와동일해야한다() {
        // given
        let input = "1+2-3+4"
        // when
        var result = ExpressionParser.parse(from: input)
        // then
        XCTAssertEqual(try result.result(), 4)
    }
    
    func testParse_두종류이상의연산자와음수양수피연산자문자열이입력됐을때_반환된Formula의result값이_문자열의계산결과와동일해야한다() {
        // given
        let input = "1+-2-3+4"
        // when
        var result = ExpressionParser.parse(from: input)
        // then
        XCTAssertEqual(try result.result(), 0)
    }
}
