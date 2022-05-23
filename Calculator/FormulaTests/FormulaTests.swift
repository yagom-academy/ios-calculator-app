//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by 전민수 on 2022/05/23.
//

import XCTest

class FormulaTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }


    func test_result_피연산수가_덧셈을_정상적으로_계산하는지_테스트() throws {
        // given
        let input = "1+2+3"
        let expectation: Double = 6
        
        //when
        var parser = ExpressionParser.parse(from: input)
        let result = try parser.result()

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_피연산수가_뺄셈을_정상적으로_계산하는지_테스트() throws {
        // given
        let input = "1-2-3"
        let expectation: Double = -4
        
        //when
        var parser = ExpressionParser.parse(from: input)
        let result = try parser.result()

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_피연산수가_곱셈을_정상적으로_계산하는지_테스트() throws {
        // given
        let input = "1*2*3"
        let expectation: Double = 6
        
        //when
        var parser = ExpressionParser.parse(from: input)
        let result = try parser.result()

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_피연산수가_나눗셈을_정상적으로_계산하는지_테스트() throws {
        // given
        let input = "10/2/5"
        let expectation: Double = 1

        //when
        var parser = ExpressionParser.parse(from: input)
        let result = try parser.result()

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_복수의_연산자와_피연산수가_혼합되어_있는_문자열값을_정상적으로_계산하는지_테스트() throws {
        // given
        let input = "10+2-3*4/6"
        let expectation: Double = 6
        
        //when
        var parser = ExpressionParser.parse(from: input)
        let result = try parser.result()

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_0으로_나눌때_오류처리가_정상적으로_이루어져_NaN의_값을_반환하는지_테스트() throws {
        // given
        let input = "100/0"
        let expectation = "NaN"
        var result = "NaN이 아닙니다"
        
        //when
        var parser = ExpressionParser.parse(from: input)
        
        do {
            _ = try parser.result()
        } catch CalculatorError.dividedByZero {
            result = "NaN"
        }
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_사칙연산자가_아닌_문자열이_입력될때_오류처리가_정상적으로_이루어지는지_테스트() throws {
        // given
        let input = "100%0#21@"
        let expectation = "사칙연산자가 아닙니다"
        var result = ""
        
        //when
        var parser = ExpressionParser.parse(from: input)
        
        do {
            _ = try parser.result()
        } catch CalculatorError.invalidOperator {
            result = "사칙연산자가 아닙니다"
        }
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_피연산수도_연산자도_없는_빈_문자열일때_에러핸들링이_정상적으로_작동하는지_테스트() throws {
        // given
        let input: String = ""
        let expectation = "큐가 비었습니다"
        var result = ""
        
        //when
        var parser = ExpressionParser.parse(from: input)
        
        do {
            _ = try parser.result()
        } catch CalculatorError.emptyQueues {
            result = "큐가 비었습니다"
        }
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    
    func test_result_사칙연산자만으로_구성된_문자열이_입력될때_오류처리가_정상적으로_이루어지는지_테스트() throws {
        // given
        let input = "+-*/"
        let expectation = "피연산수가 부족합니다"
        var result = ""
        
        //when
        var parser = ExpressionParser.parse(from: input)
        
        do {
            _ = try parser.result()
        } catch CalculatorError.notEnoughOperands {
            result = "피연산수가 부족합니다"
        }
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_피연산수만으로_구성된_문자열이_입력될때_오류처리가_정상적으로_이루어지는지_테스트() throws {
        // given
        let input = "101231240010281"
        let expectation = "연산자가 부족합니다"
        var result = ""
        
        //when
        var parser = ExpressionParser.parse(from: input)
        
        do {
            _ = try parser.result()
        } catch CalculatorError.notEnoughOperators {
            result = "연산자가 부족합니다"
        }
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_연산자와_피연산수가_올바른_순서를_따르지_않을때_오류처리가_정상적으로_이루어지는지_테스트() throws {
        // given
        let input = "+-*/123"
        let expectation = "피연산수가 부족합니다"
        var result = ""
        
        //when
        var parser = ExpressionParser.parse(from: input)
        
        do {
            _ = try parser.result()
        } catch CalculatorError.notEnoughOperands {
            result = "피연산수가 부족합니다"
        } catch CalculatorError.notEnoughOperators {
            result = "연산자가 부족합니다"
        }
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_피연산수와_연산자가_아닌_값이_혼합된_문자열값에_대하여_에러처리가_정상적으로_이루어지는지_테스트() throws {
        // given
        let input = "1223#1231555^!2!12231"
        let expectation = "사칙연산자가 아닙니다"
        var result = ""

        //when
        var parser = ExpressionParser.parse(from: input)

        do {
            _ = try parser.result()
        } catch CalculatorError.invalidOperator {
            result = "사칙연산자가 아닙니다"
        }

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_소수점_아래_자리수가_큰_피연산수를_입력받았을때_정상적으로_값이_출력되는지_테스트() throws {
        // given
        let input = "0.000001*0.000002"
        let expectation = 0.000001 * 0.000002
       
        //when
        var parser = ExpressionParser.parse(from: input)
        let result = try parser.result()

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_실수인_수가_있는_피연산수를_입력받았을때_정상적으로_값이_출력되는지_테스트() throws {
        // given
        let input = "4.3+1/5*10.2"
        let expectation = ((4.3 + 1) / 5) * 10.2
       
        //when
        var parser = ExpressionParser.parse(from: input)
        let result = try parser.result()

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_음수로_시작하는_피연산수를_입력받았을때_정상적으로_값이_출력되는지_테스트() throws {
        // given
        let input = "-4.3+1/5*10.2"
        let expectation = ((-4.3 + 1) / 5) * 10.2
       
        //when
        var parser = ExpressionParser.parse(from: input)
        let result = try parser.result()

        // then
        XCTAssertEqual(result, expectation)
    }
}
