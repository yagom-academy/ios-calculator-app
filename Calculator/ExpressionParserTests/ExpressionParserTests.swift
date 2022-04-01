//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by 김태훈 on 2022/03/29.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {    
    func test_parser_함수를_호출했을때_숫자와_기호가_분리되는지() {
        // given
        let someString = "1 + 2"
        // when
        let result = ExpressionParser.parse(from: someString)
        // then
        XCTAssertEqual(result.operands.first, 1)
        XCTAssertEqual(result.operands.last, 2)
        XCTAssertEqual(result.operators.first, Operator.add)
    }
}
