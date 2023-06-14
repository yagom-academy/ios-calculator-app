//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Erick on 2023/06/02.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    
    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }
    
    func test_피연산자에_2_3을_넣고_연산자에_add를_넣으면_result가_5를_반환합니다() {
        let input: Double = 2
        let input2: Double = 3
        var inputOpernds = CalculatorItemQueue<Double>()
        inputOpernds.enqueue(input)
        inputOpernds.enqueue(input2)
        let inputOperator: Operator = .add
        var inputOperators = CalculatorItemQueue<Operator>()
        inputOperators.enqueue(inputOperator)
        let expectation: Double = 5
        
        var formula = Formula(operands: inputOpernds, operators: inputOperators)
        let result = formula.result()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_피연산자가_없을때_result가_0을_반환합니다() {
        let expectation: Double = 0
        
        var formula = Formula(operands: CalculatorItemQueue<Double>(),
                              operators: CalculatorItemQueue<Operator>())
        let result = formula.result()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_연산자가_없을때_result가_피연산자를_반환합니다() {
        let input: Double = 5
        var inputOpernds = CalculatorItemQueue<Double>()
        inputOpernds.enqueue(input)
        let expectation: Double = 5
        
        var formula = Formula(operands: inputOpernds,
                              operators: CalculatorItemQueue<Operator>())
        let result = formula.result()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_두번째_피연산자가_없을때_result가_첫번째_피연산자를_반환합니다() {
        let input: Double = 5
        var inputOpernds = CalculatorItemQueue<Double>()
        inputOpernds.enqueue(input)
        let inputOperator: Operator = .add
        var inputOperators = CalculatorItemQueue<Operator>()
        inputOperators.enqueue(inputOperator)
        let expectation: Double = 5
        
        var formula = Formula(operands: inputOpernds,
                              operators: inputOperators)
        let result = formula.result()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_0으로_나누면_result가_nan을_반환합니다() {
        let input: Double = 4
        let input2: Double = 0
        var inputOpernds = CalculatorItemQueue<Double>()
        inputOpernds.enqueue(input)
        inputOpernds.enqueue(input2)
        let inputOperator: Operator = .divide
        var inputOperators = CalculatorItemQueue<Operator>()
        inputOperators.enqueue(inputOperator)
                
        var formula = Formula(operands: inputOpernds,
                              operators: inputOperators)
        let result = formula.result().isNaN
        
        XCTAssertTrue(result)
    }
}
