//
//  ParserTests.swift
//  ParserTests
//
//  Created by 무리 on 2023/02/01.
//

import XCTest
@testable import Calculator

final class ParserTests: XCTestCase {
    //MARK: - parse Unit Test
    func test_parse호출시_각각의Queue에_예상한count만큼_enqueue된다() {
        // given
        let input = "8 + -2 - 2 / 4 * 15"
        let operandsExpectationCount = 5
        let operatorsExpectationCount = 4
        
        // when
        let result = ExpressionParser.parse(from: input)

        // then
        XCTAssertEqual(result.operands.count, operandsExpectationCount)
        XCTAssertEqual(result.operators.count, operatorsExpectationCount)
    }
}
