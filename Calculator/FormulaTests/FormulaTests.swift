//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by 전민수 on 2022/05/23.
//

import XCTest

class FormulaTests: XCTestCase {
    var sut: Formula!
    override func setUpWithError() throws {
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<String>())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_result_피연산수가_덧셈을_정상적으로_계산하는지_테스트() throws {
        // given
        let input = "1+2+3"
        let parser = ExpressionParser.parse(from: input)
        let expectation: Double = 6
        
        // when
        sut.operands = parser.operands
        sut.operators = parser.operators
        let result = sut.result()

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_피연산수가_뺄셈을_정상적으로_계산하는지_테스트() throws {
        // given
        let input = "1-2-3"
        let parser = ExpressionParser.parse(from: input)
        let expectation: Double = -4
        
        // when
        sut.operands = parser.operands
        sut.operators = parser.operators
        let result = sut.result()

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_피연산수가_곱셈을_정상적으로_계산하는지_테스트() throws {
        // given
        let input = "1*2*3"
        let parser = ExpressionParser.parse(from: input)
        let expectation: Double = 6
        
        // when
        sut.operands = parser.operands
        sut.operators = parser.operators
        let result = sut.result()

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_피연산수가_나눗셈을_정상적으로_계산하는지_테스트() throws {
        // given
        let input = "10/2/5"
        let parser = ExpressionParser.parse(from: input)
        let expectation: Double = 1
        
        // when
        sut.operands = parser.operands
        sut.operators = parser.operators
        let result = sut.result()

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_복수의_연산자와_피연산수가_혼합되어_있는_문자열값을_정상적으로_계산하는지_테스트() throws {
        // given
        let input = "10+2-3*4/6"
        let parser = ExpressionParser.parse(from: input)
        let expectation: Double = 6
        
        // when
        sut.operands = parser.operands
        sut.operators = parser.operators
        let result = sut.result()

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_연산자와_피연산수가_아닌_값이_혼합된_문자열값에_대하여_0을_반환하는지_테스트() throws {
        // given
        let input = "ㅁㄴㅇㄹ123"
        let parser = ExpressionParser.parse(from: input)
        let expectation: Double = 0
        
        // when
        sut.operands = parser.operands
        sut.operators = parser.operators
        let result = sut.result()

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_0으로_나눌때_오류처리가_정상적으로_이루어져_NaN의_값을_반환하는지_테스트() throws {
        // given
        let input = "100/0"
        let parser = ExpressionParser.parse(from: input)
        
        // when
        sut.operands = parser.operands
        sut.operators = parser.operators
        let result = sut.result().isNaN
        
        // then
        XCTAssertTrue(result)
    }
}
