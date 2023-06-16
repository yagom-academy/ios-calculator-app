//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Zion & Dasan on 2023/06/06.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_parser_문자열이_2_더하기_3_빼기_4일때_반환값의result값은_1이다() {
        // given
        var formula = ExpressionParser<CalculatorItemQueue, CalculatorItemQueue>.parser(from: "2+3−4")
        let expectation = 1.0
        
        // when
        let result = formula.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parser_문자열이_2_곱하기_4_나누기_8일때_반환값의result값은_1이다() {
        // given
        var formula = ExpressionParser<CalculatorItemQueue, CalculatorItemQueue>.parser(from: "2×4÷8")
        let expectation = 1.0
        
        // when
        let result = formula.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parser_문자열이_더하기_3일때_반환값의result값은_3이다() {
        // given
        var formula = ExpressionParser<CalculatorItemQueue, CalculatorItemQueue>.parser(from: "+3")
        let expectation = 3.0
        
        // when
        let result = formula.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parser_문자열이_3_더하기일때_반환값의result값은_3이다() {
        // given
        var formula = ExpressionParser<CalculatorItemQueue, CalculatorItemQueue>.parser(from: "3+")
        let expectation = 3.0
        
        // when
        let result = formula.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
