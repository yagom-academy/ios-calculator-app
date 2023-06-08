//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Dasan on 2023/06/06.
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

    func test_parser_문자열이_1_더하기_2_더하기_3일때_반환값의operands의_count는_3이다() {
        // given
        let formula = ExpressionParser.parser(from: "1+2+3")
        let expectation = 3
        
        // when
        let result = formula.operands.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parser_문자열이_1_더하기_2_더하기_3일때_반환값의operators의_count는_2이다() {
        // given
        let formula = ExpressionParser.parser(from: "1+2+3")
        let expectation = 2
        
        // when
        let result = formula.operators.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parser_문자열이_1_더하기_2_빼기_3일때_반환값의operators의_first값은_더하기이다() {
        // given
        let formula = ExpressionParser.parser(from: "1+2-3")
        let expectation = Operator.add
        
        // when
        let result = formula.operators.first
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parser_문자열이_1_더하기_2_빼기_3일때_반환값의operators의_last값은_빼기이다() {
        // given
        let formula = ExpressionParser.parser(from: "1+2-3")
        let expectation = Operator.subtract
        
        // when
        let result = formula.operators.last
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parser_문자열이_2_곱하기_4_나누기_8일때_반환값의operators의_first값은_곱하기이다() {
        // given
        let formula = ExpressionParser.parser(from: "2×4÷8")
        let expectation = Operator.multiply
        
        // when
        let result = formula.operators.first
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parser_문자열이_2_곱하기_4_나누기_8일때_반환값의operators의_last값은_나누기이다() {
        // given
        let formula = ExpressionParser.parser(from: "2×4÷8")
        let expectation = Operator.divide
        
        // when
        let result = formula.operators.last
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parser_문자열이_2_곱하기_4_나누기_8일때_반환값의result값은_1이다() {
        // given
        var formula = ExpressionParser.parser(from: "2×4÷8")
        let expectation = 1.0
        
        // when
        let result = try! formula.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parser_문자열이_더하기_3일때_반환값의result값은_3이다() {
        // given
        var formula = ExpressionParser.parser(from: "+3")
        let expectation = 3.0
        
        // when
        let result = try! formula.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parser_문자열이_3_더하기일때_반환값의result값은_3이다() {
        // given
        var formula = ExpressionParser.parser(from: "3+")
        let expectation = 3.0
        
        // when
        let result = try! formula.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
}
