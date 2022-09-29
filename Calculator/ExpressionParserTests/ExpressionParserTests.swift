//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Ayaan on 2022/09/28.
//

import XCTest

class ExpressionParserTests: XCTestCase {
    func testExpressionParser_주어진_String_Type_10_더하기_10_빼기_30_곱하기_40_나누기_2를_ExpressionParser_Type의_parse_메소드의_전달인자로_호출한_후_반환된_Fromaula_Type의_result메소드를_호출한_경우_그_결과는_음수인_실수200과_같다() {
        //given
        let input: String = "10+10−30×40÷2"
        
        //when
        var formula: Formula = ExpressionParser.parse(from: input)
        let result: Double = formula.result()
        
        //then
        XCTAssertEqual(-200.0, result)
    }
    
    func testExpressionParser_주어진_String_Type_10_더하기_음수10_빼기_30_곱하기_40_나누기_2를_ExpressionParser_Type의_parse_메소드의_전달인자로_호출한_후_반환된_Fromaula_Type의_result메소드를_호출한_경우_그_결과는_음수인_실수600과_같다() {
        //given
        let input: String = "10+-10−30×40÷2"
        
        //when
        var formula: Formula = ExpressionParser.parse(from: input)
        let result: Double = formula.result()
        
        //then
        XCTAssertEqual(-600.0, result)
    }
    
    func testExpressionParser_주어진_String_Type_10_빼기_10_곱하기_20을_ExpressionParser_Type의_parse_메소드의_전달인자로_호출한_후_반환된_Fromaula_Type의_result메소드를_호출한_경우_그_결과는_0과_같다() {
        //given
        let input: String = "10−10×20"
        
        //when
        var formula: Formula = ExpressionParser.parse(from: input)
        let result: Double = formula.result()
        
        //then
        XCTAssertEqual(Double.zero, result)
    }
    func testExpressionParser_주어진_String_Type_10_더하기_10_나누기_0을_ExpressionParser_Type의_parse_메소드의_전달인자로_호출한_후_반환된_Fromaula_Type의_result메소드를_호출한_경우_그_결과는_infinity이다() {
        //given
        let input: String = "10+10÷0"
        
        //when
        var formula: Formula = ExpressionParser.parse(from: input)
        let result: Double = formula.result()
        
        //then
        XCTAssertTrue(result.isInfinite)
    }
    
    func testExpressionParser_주어진_String_Type_마이너스10_더하기_마이너스10_나누기_0을_ExpressionParser_Type의_parse_메소드의_전달인자로_호출한_후_반환된_Fromaula_Type의_result메소드를_호출한_경우_그_결과는_infinity이다() {
        //given
        let input: String = "-10+-10÷0"
        
        //when
        var formula: Formula = ExpressionParser.parse(from: input)
        let result: Double = formula.result()
        
        //then
        XCTAssertTrue(result.isInfinite)
    }
    
    func testExpressionParser_주어진_String_Type_10_빼기_10_나누기_0을_ExpressionParser_Type의_parse_메소드의_전달인자로_호출한_후_반환된_Fromaula_Type의_result메소드를_호출한_경우_그_결과는_nan이다() {
        //given
        let input: String = "10−10÷0"
        
        //when
        var formula: Formula = ExpressionParser.parse(from: input)
        let result: Double = formula.result()
        
        //then
        XCTAssertTrue(result.isNaN)
    }
}

