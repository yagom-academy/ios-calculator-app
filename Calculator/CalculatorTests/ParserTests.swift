//
//  ParserTests.swift
//  ParserTests
//
//  Created by 무리 on 2023/02/01.
//

import XCTest
@testable import Calculator

final class ParserTests: XCTestCase {
    var sut: ExpressionParser!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    //MARK: - componentsByOperators Unit Test
    /* 실험을 위해 private 삭제 후 진행
    func test_componentsByOperators시_공백을기준으로_split된_문자열을반환한다() {
        // given
        let input = "8 + -2 - 2 / 4 * 10"
        let expectation = ["8", "+", "-2", "-", "2", "/", "4", "*", "10"]
        
        // when
        let result = ExpressionParser.componentsByOperators(from: input)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    */
    
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
