//
//  FormulaTests.swift
//  CalculatorItemQueueTests
//
//  Created by 박우연 on 2021/11/16.
//

import XCTest

class FormulaTests: XCTestCase {
    var operands: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        operands = CalculatorItemQueue<Double>([])
        operators = CalculatorItemQueue<Operator>([])
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        operands = nil
        operators = nil
    }
    
    func test_result메서드를_호출했을때_더하기가_잘되는지() {
        operands.enQueueElement(1994)
        operands.enQueueElement(1004)
        operators.enQueueElement(Operator.add)
        var formula = Formula(operands: operands, operators: operators)
        
        XCTAssertEqual(try formula.result(), 2998)
    }
    
    func test_result메서드를_호출했을때_빼기가_잘되는지() {
        operands.enQueueElement(1994)
        operands.enQueueElement(1004)
        operators.enQueueElement(Operator.subtract)
        var formula = Formula(operands: operands, operators: operators)
        
        XCTAssertEqual(try formula.result(), 990)
    }
    
    func test_result메서드를_호출했을때_곱하기가_잘되는지() {
        operands.enQueueElement(10)
        operands.enQueueElement(4)
        operators.enQueueElement(Operator.multiply)
        var formula = Formula(operands: operands, operators: operators)
        
        XCTAssertEqual(try formula.result(), 40)
    }
    
    func test_result메서드를_호출했을때_나누기가_잘되는지() {
        operands.enQueueElement(10)
        operands.enQueueElement(4)
        operators.enQueueElement(Operator.divide)
        var formula = Formula(operands: operands, operators: operators)
        
        XCTAssertEqual(try formula.result(), 2.5)
    }
   
    func test_0으로_나누려고할때_에러를_던지는지() {
        operands.enQueueElement(10)
        operands.enQueueElement(0)
        operators.enQueueElement(Operator.divide)
        var formula = Formula(operands: operands, operators: operators)
        
        XCTAssertThrowsError(try formula.result())
    }
}
