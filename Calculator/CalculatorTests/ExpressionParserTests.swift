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
        let result = try! sut.result()

        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_1더하기2더하기3문자열_입력했을때_formula에_결과값이_6인지() {
        //given
        sut = ExpressionParser.parse(from: "1 + 2 + 3 ")

        //when
        let result = try! sut.result()

        //then
        XCTAssertEqual(result, 6)
    }
    
    func test_1빼기2문자열_입력했을때_formula에_결과값이_마이너스1인지() {
        //given
        sut = ExpressionParser.parse(from: "1 - 2 ")
        
        //when
        let result = try! sut.result()
        
        //then
        XCTAssertEqual(result, -1)
    }
    
    func test_1빼기2빼기3문자열_입력했을때_formula에_결과값이_마이너스4인지() {
        //given
        sut = ExpressionParser.parse(from: "1 - 2 - 3 ")
        
        //when
        let result = try! sut.result()
        
        //then
        XCTAssertEqual(result, -4)
    }
    
    func test_1빼기마이너스5문자열_입력했을때_formula에_결과값이_6인지() {
        //given
        sut = ExpressionParser.parse(from: "1 - -5 ")
        
        //when
        let result = try! sut.result()
        
        //then
        XCTAssertEqual(result, 6)
    }
    
    func test_1곱하기2문자열_입력했을때_formula에_결과값이_2인지() {
        //given
        sut = ExpressionParser.parse(from: "1 x 2 ")
        
        //when
        let result = try! sut.result()
        
        //then
        XCTAssertEqual(result, 2)
    }
    
    func test_1곱하기2곱하기마이너스3문자열_입력했을때_formula에_결과값이_마이너스6인지() {
        //given
        sut = ExpressionParser.parse(from: "1 x 2 x -3 ")
        
        //when
        let result = try! sut.result()
        
        //then
        XCTAssertEqual(result, -6)
    }
    
    func test_1나누기2문자열_입력했을때_formula에_결과값이_0점5인지() {
        //given
        sut = ExpressionParser.parse(from: "1 % 2 ")
        
        //when
        let result = try! sut.result()
        
        //then
        XCTAssertEqual(result, 0.5)
    }
    
    func test_1나누기2나누기5문자열_입력했을때_formula에_결과값이_0점1인지() {
        //given
        sut = ExpressionParser.parse(from: "1 % 2 % 5 ")
        
        //when
        let result = try! sut.result()
        
        //then
        XCTAssertEqual(result, 0.1)
    }
    
    func test_operators로_끝나는_문자열이_입력되었을때_unfinishedFormula_error에_걸리는지() {
        //given
        sut = ExpressionParser.parse(from: "1 % 2 % ")
        let errorMessage = CalculatorErrors.unfinishedFormula
        var error: CalculatorErrors?
        
        //when
        XCTAssertThrowsError(try sut.result()){ result in
            error = result as? CalculatorErrors
        }
        
        //then
        XCTAssertEqual(error, errorMessage)
    }
    
    func test_operators_문자열만_입력되었을때_unfinishedFormula_error에_걸리는지() {
        //given
        sut = ExpressionParser.parse(from: "% ")
        let errorMessage = CalculatorErrors.unfinishedFormula
        var error: CalculatorErrors?
        
        //when
        XCTAssertThrowsError(try sut.result()){ result in
            error = result as? CalculatorErrors
        }
        
        //then
        XCTAssertEqual(error, errorMessage)
    }
    
    func test_빈문자열이_입력되었을때_unfinishedFormula_error에_걸리는지() {
        //given
        sut = ExpressionParser.parse(from: " ")
        let errorMessage = CalculatorErrors.unfinishedFormula
        var error: CalculatorErrors?
        
        //when
        XCTAssertThrowsError(try sut.result()){ result in
            error = result as? CalculatorErrors
        }
        
        //then
        XCTAssertEqual(error, errorMessage)
    }
}
