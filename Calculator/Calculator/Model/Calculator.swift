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
    private(set) var currentOperand: String = "0"
    var isNegativeOperand: Bool {
        return currentOperand.contains(MathSymbol.negative)
    }
    
    var isDecimal: Bool {
        return currentOperand.contains(MathSymbol.dot)
    }
    
    func clearCalculator() {
        expression = ""
        currentOperator = ""
        currentOperand = "0"
    }
    
    func calculatedResult() -> Double {
        var formula: Formula = ExpressionParser.parser(from: expression)
        return 0.0
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
