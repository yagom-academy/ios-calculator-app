//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 이시원 on 2022/03/18.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
        
    func test_parse에_1_플러스_2_곱하기_마이너스3_입력_parse의_result_return_마이너스9() {
        // when
        let result = try? ExpressionParser.parse(from: "1 + 2 × -3").result()
        // then
        XCTAssertEqual(result, -9.0)
    }
    
    func test_parse에_플러스_2_곱하기_마이너스3_입력_parse의_result_return_마이너스6() {
        // when
        let result = try? ExpressionParser.parse(from: " + 2 × -3").result()
        
        // then
        XCTAssertEqual(result, -6.0)
    }
    
    func test_연산자가_아닌_값이_들어왔을_때_invalidOperatorInput오류를_던지는지() {
        
        // then
        XCTAssertThrowsError(try ExpressionParser.parse(from: "1 + 2 . -3").result()) { error in
            XCTAssertEqual(error as? CalauletorError, CalauletorError.invalidOperatorInput)
        }
    }
    
    func test_중간에_0으로_나눴을때_dividedByZero오류를_던지는지() {
        
        // then
        XCTAssertThrowsError(try ExpressionParser.parse(from: "1 + 2 ÷ 0 + 1").result()) { error in
            XCTAssertEqual(error as? CalauletorError, CalauletorError.dividedByZero)
        }
    }
}
