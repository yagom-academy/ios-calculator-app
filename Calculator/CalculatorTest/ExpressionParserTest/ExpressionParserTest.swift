//
//  ExpressionParserTest.swift
//  ExpressionParserTest
//
//  Created by Lee minyeol on 2023/10/10.
//

import XCTest
@testable import Calculator

final class ExpressionParserTest: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_10더하기1문자열이주어질떄_parse를_실행하면_Formula인스턴스에_operand의_count가_2가된다() {
        //given
        let expectation = 2
        //when
        let formula = ExpressionParser.parse(from: "10 + 1")
        let result = formula.operands.count
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_1더하기1문자열이주어질떄_parse를_실행하면_Formula인스턴스에_operators_count가_1이된다() {
        //given
        let expectation = 1
        //when
        let formula = ExpressionParser.parse(from: "1 + 1")
        let result = formula.operators.count
        //then
        XCTAssertEqual(result, expectation)
    }

}
