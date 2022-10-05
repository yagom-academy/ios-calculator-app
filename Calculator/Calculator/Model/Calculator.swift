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
        return currentOperand.contains("−")
    }
    
    
    func calculatedResult() -> Double {
        var formula: Formula = ExpressionParser.parser(from: expression)
        return 0.0
    }

    func updateCurrentOperand(_ number: String) {
        currentOperand = number
    }
}
