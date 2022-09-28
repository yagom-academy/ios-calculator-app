//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 이정민 on 2022/09/23.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        sut = Formula()
    }
    
    func test_When_generate_result_Then_expects_Not_nil() {
        // given
        
        // when
        let result = try? sut.result()
        
        // then
        XCTAssertNotNil(result)
        
    }
    
    func test_When_generate_operands_Then_expects_Not_nil() {
        // given
        
        // when
        let operands = sut.operands
        
        // then
        XCTAssertNotNil(operands)
        
    }
    
    func test_When_generate_operators_Then_expects_Not_nil() {
        // given
        
        
        // when
        let operators = sut.operators
        
        // then
        XCTAssertNotNil(operators)
        
    }
    
    func test_When_enqueue_add_in_operators_Then_enqueue_success() {
        // given
        let testOperator: Operator = .add
        
        // when
        sut.operators.enqueue(testOperator)
        let result = sut.operators.dequeue()
        
        // then
        XCTAssertEqual(result, testOperator)
    }
    
    func test_When_testString_calculate_Then_return_right_answer() {
        // given
        let testString1 = "1+2-3+4"
        let testString2 = "12+4/4*5-10"
        let answer1: Double = 4
        let answer2: Double = 10
        
        // when
        sut = ExpressionParser.parse(from: testString1)
        let result1 = try? sut.result()
        sut = ExpressionParser.parse(from: testString2)
        let result2 = try? sut.result()
        
        // then
        XCTAssertEqual(result1, answer1)
        XCTAssertEqual(result2, answer2)
    }
    
    func test_When_divide_0_Then_throw_Error() {
        // given
        let testString = "1/0"
        
        // when
        sut = ExpressionParser.parse(from: testString)
        
        // then
        XCTAssertThrowsError(try sut.result())
    }
    
    func test_When_formula_is_wrong_Then_throw_wrongFormulaError() {
        // given
        let testString = "1+2/"
        
        // when
        sut = ExpressionParser.parse(from: testString)
        
        // then
        XCTAssertThrowsError(try sut.result())
    }
}
