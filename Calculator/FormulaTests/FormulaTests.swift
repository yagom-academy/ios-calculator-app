//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Christy Lee on 2023/02/01.
//

import XCTest

final class FormulaTests: XCTestCase {
    var sut: Formula!
    var operands: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!

    override func setUpWithError() throws {
        operands = CalculatorItemQueue<Double>()
        operators = CalculatorItemQueue<Operator>()
        sut = Formula(operands: operands, operators: operators)
    }

    func test_입력값이주어질때_result호출시_결과값을반환한다() {
        // given
        //1+2÷3×4−5
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(3.0)
        sut.operands.enqueue(4.0)
        sut.operands.enqueue(5.0)
        
        sut.operators.enqueue(Operator.add)
        sut.operators.enqueue(Operator.divide)
        sut.operators.enqueue(Operator.multiply)
        sut.operators.enqueue(Operator.subtract)
        let expectation = -1.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_음수와빼기연산자가주어질때_result호출시_결과값을반환한다() {
        // given
        //1+2÷3×4−(-5)
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(3.0)
        sut.operands.enqueue(4.0)
        sut.operands.enqueue(-5.0)
        
        sut.operators.enqueue(Operator.add)
        sut.operators.enqueue(Operator.divide)
        sut.operators.enqueue(Operator.multiply)
        sut.operators.enqueue(Operator.subtract)
        let expectation = 9.0
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_숫자0으로나누는경우_result호출시_nan을반환한다() {
        // given
        //1+2÷0×4−5
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(0.0)
        sut.operands.enqueue(4.0)
        sut.operands.enqueue(-5.0)
        
        sut.operators.enqueue(Operator.add)
        sut.operators.enqueue(Operator.divide)
        sut.operators.enqueue(Operator.multiply)
        sut.operators.enqueue(Operator.subtract)
        
        // when
        let result = sut.result()
        
        // then
        XCTAssertTrue(result.isNaN)
    }
}
