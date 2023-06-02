//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Min Hyun on 2023/06/01.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        let operands = CalculatorItemQueue()
        let operators = CalculatorItemQueue()
        
        sut = Formula(operands: operands, operators: operators)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_result_연산_결과값이_예상값과_일치한다() {
        // given
        let expected = 4.0
    
        sut.operands.enqueue(5.0)
        sut.operators.enqueue(Operator.add)
        sut.operands.enqueue(-1.0)
        sut.operators.enqueue(Operator.subtract)
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(Operator.multiply)
        sut.operands.enqueue(6.0)
        sut.operators.enqueue(Operator.divide)
        sut.operands.enqueue(3.0)
        
        // when
        let result = try? sut.result()
        
        // then
        XCTAssertEqual(result, expected)
    }
    
    func test_result_연산에_0이_포함되어_예외를_반환한다() {
        // given
        sut.operands.enqueue(3.0)
        sut.operators.enqueue(Operator.divide)
        sut.operands.enqueue(0.0)
        
        // when, then
        XCTAssertThrowsError(try sut.result()) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.divideByZero)
        }
    }
    
    func test_result_연산에_잘못된_연산자가_포함되어_예외를_반환한다() {
        // given
        sut.operands.enqueue(3.0)
        sut.operators.enqueue(1)
        sut.operands.enqueue(1.0)
        
        // when, then
        XCTAssertThrowsError(try sut.result()) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.invalidOperator)
        }
    }
    
    func test_parse_넘겨받은_숫자를_제대로_연산한다() {
        // given
        let input = "12+3−5÷5×2"
        let expected = 4.0
        
        // when
        var formula = try? ExpressionParser.parse(from: input)
        let result = try? formula?.result()

        // then
        XCTAssertEqual(result, expected)
    }
    
    func test_parse_마이너스_부호가_포함한_숫자를_제대로_연산된다() {
        // given
        let input = "12+1−-2÷5×2"
        let expected = 6.0
        
        // when
        var formula = try? ExpressionParser.parse(from: input)
        let result = try? formula?.result()

        // then
        XCTAssertEqual(result, expected)
    }
    
    func test_parse_소수로_표현할_수_없는_문자가_있으면_예외를_반환한다() {
        // given
        let input = "12+a"
        
        // when
        XCTAssertThrowsError(try ExpressionParser.parse(from: input)) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.invalidInput)
        }
    }
    
    func test_parse_리턴타입이_Formula이다() {
        // given
        let input = "1+2"
        
        // when
        let formula = try? ExpressionParser.parse(from: input)
        
        // then
        XCTAssertTrue(type(of:formula) == type(of:sut))
    }
}
