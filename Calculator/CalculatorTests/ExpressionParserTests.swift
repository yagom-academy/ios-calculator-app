//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Harry on 2023/01/27.
//

import XCTest

final class ExpressionParserTests: XCTestCase {
    
    func test_문자열_5_더하기_6_더하기_7은_18이다() {
        let input = "5 + 6 + 7"
        let expectedResult: Double = 18
        
        var formula = ExpressionParser.parse(from: input)
        let result = formula.result()
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_문자열_5_빼기_6_곱하기_7은_음수7이다() {
        let input = "5 - 6 * 7"
        let expectedResult: Double = -7
        
        var formula = ExpressionParser.parse(from: input)
        let result = formula.result()
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_문자열_6_나누기_3_곱하기_7은_14이다() {
        let input = "6 / 3 * 7"
        let expectedResult: Double = 14
        
        var formula = ExpressionParser.parse(from: input)
        let result = formula.result()
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_3_곱하기_8_빼기_2_나누기_0은_nan이다() {
        let input = "3 * 8 - 2 / 0"
        
        var formula = ExpressionParser.parse(from: input)
        let result = formula.result().isNaN
        
        XCTAssertTrue(result)
    }
}
