//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Daehoon Lee on 2023/06/06.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    func test_parse_수식이주어지면_연산자를기준으로문자열을나누고_각각의Queue에맞게입력한다() {
        // given
        let expectedString: String = "1+2"
        
        // when
        var result: Formula = ExpressionParser.parse(from: expectedString)
        
        // then
        XCTAssertEqual(result.operands.dequeue(), 1)
        XCTAssertEqual(result.operands.dequeue(), 2)
        XCTAssertEqual(result.operators.dequeue(), .add)
    }
}
