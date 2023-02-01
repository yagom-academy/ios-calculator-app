//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Seoyeon Hong on 2023/01/31.
//

import XCTest

final class FormulaTests: XCTestCase {
    
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.sut = Formula()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
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
        self.sut.operands.enqueue(1.0)
        self.sut.operators.enqueue(Operator.add)
        self.sut.operands.enqueue(2.0)
        self.sut.operators.enqueue(Operator.add)
        
        // when
        let result = self.sut.result()
        // then
        XCTAssertEqual(result, 3.0)
    }
    
    func testResult_givenZeroOperand_and_devideOperator_returnNan() {
        //given
        self.sut.operands.enqueue(1.0)
        self.sut.operators.enqueue(Operator.divide)
        self.sut.operands.enqueue(.zero)
        
        //when
        let result = self.sut.result()
        
        //then
        XCTAssertTrue(result.isNaN)
    }
    
    func testResult_givenTwoOperands_and_addOperator_return3() {
        //given
        self.sut.operands.enqueue(1.0)
        self.sut.operators.enqueue(Operator.add)
        self.sut.operands.enqueue(2.0)
        let expectation: Double = 3.0
        
        //when
        let result = self.sut.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func testResult_givenTwoOperands_and_subtractOperator_return1() {
        //given
        self.sut.operands.enqueue(2.0)
        self.sut.operators.enqueue(Operator.substact)
        self.sut.operands.enqueue(1.0)
        let expectation: Double = 1.0
        
        //when
        let result = self.sut.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func testResult_givenTwoOperands_and_multiplyOperator_return2() {
        //given
        self.sut.operands.enqueue(1.0)
        self.sut.operators.enqueue(Operator.multiply)
        self.sut.operands.enqueue(2.0)
        let expectation: Double = 2.0
        
        //when
        let result = self.sut.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func testResult_operator_isEmpty_returnFirstOperand() {
        //given
        self.sut.operands.enqueue(1.0)
        self.sut.operands.enqueue(2.0)
        let expectation: Double = 1.0
        
        //when
        let result = self.sut.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
}
