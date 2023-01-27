//
//  FormulaTest.swift
//  FormulaTest
//
//  Created by 천승현 on 2023/01/27.
//

import XCTest

final class FormulaTest: XCTestCase {
    
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_add호출시_피연산자가2와5이고연산자가플러스라면_7을반환한다() {
        // given
        let operand1 = 2.0
        let operand2 = 5.0
        let oper = Operator.add
        let operandQueue = CalculatorItemQueue<Double>(enqueueStack: [operand1, operand2])
        let operatorQueue = CalculatorItemQueue<Operator>(enqueueStack: [oper])
        let expectaiton = 7.0
        
        // when
        sut = Formula(operands: operandQueue, operators: operatorQueue)
        
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectaiton)
    }
    // 20+30+
    
    func test_add호출시_피연산자가20과30과50이고연산자가플러스두개라면_100을반환한다() {
        // given
        let operand1 = 20.0
        let operand2 = 30.0
        let operand3 = 50.0
        let oper = Operator.add
        let oper2 = Operator.add
        let operandQueue = CalculatorItemQueue<Double>(enqueueStack: [operand1, operand2, operand3])
        let operatorQueue = CalculatorItemQueue<Operator>(enqueueStack: [oper, oper2])
        let expectaiton = 100.0
        
        // when
        sut = Formula(operands: operandQueue, operators: operatorQueue)
        
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectaiton)
    }
    
    func test_add호출시_피연산자가20과30과연산자가플러스두개라면_50을반환한다() {
        // given
        let operand1 = 20.0
        let operand2 = 30.0
        let oper = Operator.add
        let oper2 = Operator.add
        let operandQueue = CalculatorItemQueue<Double>(enqueueStack: [operand1, operand2])
        let operatorQueue = CalculatorItemQueue<Operator>(enqueueStack: [oper, oper2])
        let expectaiton = 50.0
        
        // when
        sut = Formula(operands: operandQueue, operators: operatorQueue)
        
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectaiton)
    }
    


}
