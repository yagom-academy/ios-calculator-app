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
        sut.operators.enqueue("+")
        sut.operands.enqueue(-1.0)
        sut.operators.enqueue("-")
        sut.operands.enqueue(2.0)
        sut.operators.enqueue("*")
        sut.operands.enqueue(6.0)
        sut.operators.enqueue("/")
        sut.operands.enqueue(3.0)
        
        // when
        let result = try? sut.result()
        
        // then
        XCTAssertEqual(result, expected)
    }
    
    func test_result_연산에_0이_포함되어_예외를_반환한다() {
        // given
        sut.operands.enqueue(3.0)
        sut.operators.enqueue("/")
        sut.operands.enqueue(0.0)
        
        // when, then
        XCTAssertThrowsError(try sut.result()) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.divideByZero)
        }
    }
    
    func test_result_연산에_잘못된_숫자가_포함되어_예외를_반환한다() {
        // given
        sut.operands.enqueue(3.0)
        sut.operators.enqueue("/")
        sut.operands.enqueue("1")
        
        // when, then
        XCTAssertThrowsError(try sut.result()) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.invalidInput)
        }
    }
    
    func test_result_연산에_잘못된_연산자가_포함되어_예외를_반환한다() {
        // given
        sut.operands.enqueue(3.0)
        sut.operators.enqueue("(")
        sut.operands.enqueue(1.0)
        
        // when, then
        XCTAssertThrowsError(try sut.result()) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.invalidOperator)
        }
    }
}
