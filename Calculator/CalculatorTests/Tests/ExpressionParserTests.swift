//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by Jun Bang on 2021/11/14.
//

import XCTest
@testable import Calculator
class ExpressionParserTests: XCTestCase {
    
    func testExpressionParserParse_givenMixedExpression_expectCorrectFormula() throws {
        let testOperands: [Double] = [10, 23, 4]
        let testOperators: [Operator] = [.add, .divide]
        var mockFormula = Formula(operands: createQueue(with: testOperands), operators: createQueue(with: testOperators))
        var resultFormula = ExpressionParser.parse(from: "10+23÷4")
        XCTAssertTrue(try isSameFormula(formula: &resultFormula, otherFormula: &mockFormula))
    }
    
    func testExpressionParserParse_givenInvalidExpression_expectCorrectFormula() throws {
        let testOperands: [Double] = [10, 23, 4]
        let testOperators: [Operator] = [.add, .divide, .subtract, .multiply]
        var mockFormula = Formula(operands: createQueue(with: testOperands), operators: createQueue(with: testOperators))
        var resultFormula = ExpressionParser.parse(from: "10+23÷4−𝗑")
        XCTAssertTrue(try isSameFormula(formula: &resultFormula, otherFormula: &mockFormula))
    }
    
    func testExpressionParserParse_givenOnlyOperators_expectCorrectFormula() throws {
        let testOperands: [Double] = []
        let testOperators: [Operator] = [.add, .divide, .subtract, .multiply]
        var mockFormula = Formula(operands: createQueue(with: testOperands), operators: createQueue(with: testOperators))
        var resultFormula = ExpressionParser.parse(from: "+÷−𝗑")
        XCTAssertTrue(try isSameFormula(formula: &resultFormula, otherFormula: &mockFormula))
    }
    
    private func createQueue<T>(with elements: [T]) -> CalculatorItemQueue<T> {
        var queue = CalculatorItemQueue<T>()
        for element in elements {
            queue.enqueue(element)
        }
        return queue
    }
    
    private func isSameFormula(formula: inout Formula, otherFormula: inout Formula) throws -> Bool {
        let firstFormulaOperands = try convertToArray(from: &formula.operands)
        let firstFormulaOperators = try convertToArray(from: &formula.operators)
        let secondFormulaOperands = try convertToArray(from: &otherFormula.operands)
        let secondFormulaOperators = try convertToArray(from: &otherFormula.operators)
        return firstFormulaOperands == secondFormulaOperands && firstFormulaOperators == secondFormulaOperators
    }
    
    private func convertToArray<T>(from queue: inout CalculatorItemQueue<T>) throws -> [T] {
        var elements: [T] = []
        while queue.isNotEmpty {
            let element = try queue.dequeue()
            elements.append(element)
        }
        return elements
    }
    
}
