//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by mint on 2023/06/06.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_1더하기2문자열_입력했을때_formula에_결과값이_3인지() {
        //given
        sut = ExpressionParser.parse(from: "1 + 2 ")

        //when
        let result = sut.result()

        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_1더하기2더하기3문자열_입력했을때_formula에_결과값이_6인지() {
        //given
        sut = ExpressionParser.parse(from: "1 + 2 + 3 ")

        //when
        let result = sut.result()

        //then
        XCTAssertEqual(result, 6)
    }
    
    func test_1빼기2문자열_입력했을때_formula에_결과값이_마이너스1인지() {
        //given
        sut = ExpressionParser.parse(from: " 1 − 2 ")
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, -1)
    }
    
    func test_1빼기2빼기3문자열_입력했을때_formula에_결과값이_마이너스4인지() {
        //given
        sut = ExpressionParser.parse(from: " 1 − 2 − 3 ")
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, -4)
    }
    
    func test_1빼기마이너스5문자열_입력했을때_formula에_결과값이_6인지() {
        //given
        sut = ExpressionParser.parse(from: " 1 − -5 ")
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, 6)
    }
    
    func test_1곱하기2문자열_입력했을때_formula에_결과값이_2인지() {
        //given
        sut = ExpressionParser.parse(from: " 1 × 2 ")
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, 2)
    }
    
    func test_1곱하기2곱하기마이너스3문자열_입력했을때_formula에_결과값이_마이너스6인지() {
        //given
        sut = ExpressionParser.parse(from: " 1 × 2 × -3 ")
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, -6)
    }
    
    func test_1나누기2문자열_입력했을때_formula에_결과값이_0점5인지() {
        //given
        sut = ExpressionParser.parse(from: " 1 ÷ 2 ")
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, 0.5)
    }
    
    func test_1나누기2나누기5문자열_입력했을때_formula에_결과값이_0점1인지() {
        //given
        sut = ExpressionParser.parse(from: " 1 ÷ 2 ÷ 5 ")
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, 0.1)
    }
    
    func test_8나누기2빼기4문자열_입력했을때_formula에_결과값이_0인지() {
        //given
        sut = ExpressionParser.parse(from: " 8 ÷ 2 − 4 ")
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, 0)
    }
    
    func test_0으로나누는문자열_입력했을때_formula에_결과값이_nan인지() {
        //given
        sut = ExpressionParser.parse(from: " 8 ÷ 0 ")
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertTrue(result.isNaN)
    }
    
}
