//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Daehoon Lee on 2023/06/06.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sutForOperand: Formula<Double>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sutForOperand = Formula(operands: CalculatorItemQueue())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sutForOperand = nil
    }
    
    func test_init_Double타입Queue로_operands가초기화되면빈상태로원소를꺼내면_nil을반환한다() {
        // given
        let expectedOperandsQueue: CalculatorItemQueue<Double> = CalculatorItemQueue()
        
        // when
        sutForOperand.operands = expectedOperandsQueue
        let result: Double? = sutForOperand.operands.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_init_Operator타입Queue로_operators가초기화되면빈상태로원소를꺼내면_nil을반환한다() {
        // given
        let expectedOperatorsQueue: CalculatorItemQueue<Operator> = CalculatorItemQueue()
        
        // when
        sutForOperand.operators = expectedOperatorsQueue
        let result: Operator? = sutForOperand.operators.dequeue()
        
        // then
        XCTAssertNil(result)
    }
}
