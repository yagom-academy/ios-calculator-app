//
//  ExpressionParserTest.swift
//  ExpressionParserTest
//
//  Created by Kiwi, Wongbing on 2022/05/20.
//

import XCTest
@testable import Calculator
class ExpressionParserTest: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_하나의_식을_문자열값으로_받은_경우_연산이_올바르게_되어야한다() {
        //given
        let expression = "2 + 6 × 5 ÷ -2"
        //when
        var result = ExpressionParser.parse(from: expression)
        //then
        XCTAssertEqual(try result.result(), -20)
    }
    func test_나누기_연산했을때_나누는수가_0이라면_에러가_발생해야한다() {
        //given
        let expression = "2 ÷ 0"
        
        //when
        var result = ExpressionParser.parse(from: expression)
        //then
        XCTAssertThrowsError(try result.result(), "divideZero") { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.divideZero)
        }
    }
}
