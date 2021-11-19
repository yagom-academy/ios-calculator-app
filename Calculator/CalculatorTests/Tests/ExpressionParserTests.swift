//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by Jun Bang on 2021/11/14.
//

import XCTest
@testable import Calculator
class ExpressionParserTests: XCTestCase {
    
    func testExpressionParserParse_givenMixedExpression_expectCorrectFormula() {
        let testOperands: [Double] = [10, 23, 4]
        let testOperators: [Operator] = [.add, .divide]
        var mockFormula = Formula(operands: createQueue(with: testOperands), operators: createQueue(with: testOperators))
        var resultFormula = ExpressionParser.parse(from: "10+23÷4")
        XCTAssertTrue(isSameFormula(formula: &resultFormula, otherFormula: &mockFormula))
    }
    
    func testExpressionParserParse_givenInvalidExpression_expectCorrectFormula() {
        let testOperands: [Double] = [10, 23, 4]
        let testOperators: [Operator] = [.add, .divide, .subtract, .multiply]
        var mockFormula = Formula(operands: createQueue(with: testOperands), operators: createQueue(with: testOperators))
        var resultFormula = ExpressionParser.parse(from: "10+23÷4−𝗑")
        XCTAssertTrue(isSameFormula(formula: &resultFormula, otherFormula: &mockFormula))
    }
    
    func testExpressionParserParse_givenOnlyOperators_expectCorrectFormula() {
        let testOperands: [Double] = []
        let testOperators: [Operator] = [.add, .divide, .subtract, .multiply]
        var mockFormula = Formula(operands: createQueue(with: testOperands), operators: createQueue(with: testOperators))
        var resultFormula = ExpressionParser.parse(from: "+÷−𝗑")
        XCTAssertTrue(isSameFormula(formula: &resultFormula, otherFormula: &mockFormula))
    }
    
    private func createQueue<T>(with elements: [T]) -> CalculatorItemQueue<T> {
        var queue = CalculatorItemQueue<T>()
        for element in elements {
            queue.enqueue(element)
        }
        return queue
    }
    
    private func isSameFormula(formula: inout Formula, otherFormula: inout Formula) -> Bool {
        let firstFormulaOperands = convertToArray(from: &formula.operands)
        let firstFormulaOperators = convertToArray(from: &formula.operators)
        let secondFormulaOperands = convertToArray(from: &otherFormula.operands)
        let secondFormulaOperators = convertToArray(from: &otherFormula.operators)
        return firstFormulaOperands == secondFormulaOperands && firstFormulaOperators == secondFormulaOperators
    }
    
    private func convertToArray<T>(from queue: inout CalculatorItemQueue<T>) -> [T] {
        var elements: [T] = []
        while queue.isNotEmpty {
            if let element = queue.dequeue() {
                elements.append(element)
            }
        }
        return elements
    }
    
}
