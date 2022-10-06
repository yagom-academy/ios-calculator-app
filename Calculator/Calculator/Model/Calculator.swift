//
//  Calculator.swift
//  Calculator
//
//  Created by 임지연 on 2022/10/05.
//

import Foundation

class Calculator {
    private(set) var expression: String = ""
    private(set) var currentOperator: String = ""
    private(set) var currentOperand: String = ""
    var isNegativeOperand: Bool {
        return currentOperand.contains(MathSymbol.negative)
    }
    
    var isDecimal: Bool {
        return currentOperand.contains(MathSymbol.dot)
    }
    
    var isOperandEmpty: Bool {
        return currentOperand.isEmpty
    }
    
    func clearCalculator(expression: String = "") {
        self.expression = expression
        currentOperator = ""
        currentOperand = ""
    }
    
    func calculatedResult() throws -> Double {
        var result: Double
        var formula: Formula = ExpressionParser.parser(from: expression)
        result = try formula.result()
        return result
    }

    func updateCurrentOperand(_ number: String) {
        currentOperand = number
    }
    
    func updateCurrentOperator(_ `operator`: String) {
        currentOperator = `operator`
    }
    
    func updateExpression() {
        expression += currentOperator + currentOperand
    }
}
