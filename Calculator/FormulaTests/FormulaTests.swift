//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Seoyeon Hong on 2023/01/31.
//

import XCTest

final class FormulaTests: XCTestCase {
    
    var sut = Formula()
    
    func testResult_if_OperandQueue_isEmpty_returnZero() {
        //given
        let expectation:Double = .zero
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func testResult_if_thirdOperand_isEmpty_returnFirstResult() {
        //given
        sut.operands.enqueue(1.0)
        sut.operators.enqueue(Operator.add)
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(Operator.add)
        
        // when
        let result = sut.result()
        // then
        XCTAssertEqual(result, 3.0)
    }
    
    func testResult_givenZeroOperand_and_devideOperator_returnNan() {
        //given
        sut.operands.enqueue(1.0)
        sut.operators.enqueue(Operator.divide)
        sut.operands.enqueue(.zero)
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertTrue(result.isNaN)
    }
    
    func testResult_givenTwoOperands_and_addOperator_return3() {
        //given
        sut.operands.enqueue(1.0)
        sut.operators.enqueue(Operator.add)
        sut.operands.enqueue(2.0)
        let expectation: Double = 3.0
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func testResult_givenTwoOperands_and_subtractOperator_return1() {
        //given
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(Operator.subtract)
        sut.operands.enqueue(1.0)
        let expectation: Double = 1.0
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func testResult_givenTwoOperands_and_multiplyOperator_return2() {
        //given
        sut.operands.enqueue(1.0)
        sut.operators.enqueue(Operator.multiply)
        sut.operands.enqueue(2.0)
        let expectation: Double = 2.0
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func testResult_operator_isEmpty_returnFirstOperand() {
        //given
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        let expectation: Double = 1.0
        
        //when
        let result = sut.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
}
