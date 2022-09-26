//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Hamo on 2022/09/26.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    func testParse_문자열이입력됐을때_한종류의연산자와양수의피연산자를담은Queue를가진Formula인스턴스를반환해야한다() {
        // given
        let input = "1+2+3+4"
        // when
        var result = ExpressionParser.parse(from: input)
        // then
        XCTAssertEqual(try result.result(), 10)
    }
}
