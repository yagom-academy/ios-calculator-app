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
        let result = sut.result()
        
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
}
