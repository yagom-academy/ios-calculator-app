//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by dhoney96 on 2022/05/21.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var operands: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<String>!
    var formula: Formula!

    override func setUpWithError() throws {
        operands = CalculatorItemQueue<Double>()
        operators = CalculatorItemQueue<String>()
        formula = Formula(operands: operands, operators: operators)
    }

    override func tearDownWithError() throws {
        operands = nil
        operators = nil
        formula = nil
    }
    
    func test_CalculatorItemQueue가_비어있을때_0을_반환() {
        let returnValue = 0.0
        let result = formula.result()
        
        XCTAssertEqual(result, returnValue)
    }
    
    func test_operators의_연산자가_더하기일경우_양변의합을_반환() {
        formula.operands.enqueue(123.0)
        formula.operands.enqueue(123.0)
        formula.operators.enqueue("+")

        let returnValue = 246.0
        let result = formula.result()
        
        XCTAssertEqual(returnValue, result)
    }
    
    func test_연산기호가_2개일때_계산의결과를_반환() {
        formula.operands.enqueue(123.0)
        formula.operands.enqueue(123.0)
        formula.operands.enqueue(123.0)
        
        formula.operators.enqueue("+")
        formula.operators.enqueue("-")
        
        let returnValue = 123.0
        let result = formula.result()
        
        XCTAssertEqual(returnValue, result)
    }
    
    func test_모든연산기호를_사용한_계산의결과를_반환() {
        formula.operands.enqueue(1.0)
        formula.operands.enqueue(1.0)
        formula.operands.enqueue(1.0)
        formula.operands.enqueue(10.0)
        formula.operands.enqueue(5.0)
        
        formula.operators.enqueue("+")
        formula.operators.enqueue("-")
        formula.operators.enqueue("*")
        formula.operators.enqueue("/")
        
        let returnValue = 2.0
        let result = formula.result()
        
        XCTAssertEqual(returnValue, result)
    }
}
