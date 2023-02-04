//
//  CalculatorChecker.swift
//  Calculator
//
//  Created by 천승현 on 2023/02/04.
//

import Foundation

struct CalculatorChecker {
    
    func hasCurrentInput(_ currentText: String) -> Bool {
        if currentText == Sign.empty || currentText == Sign.space {
            return false
        }
        return true
    }
    
    func hasDot(_ currentText: String) -> Bool {
        return currentText.contains(Sign.dot) ? true : false
    }
    
    func appendingDot(_ currentText: String) -> String {
        if currentText == Sign.empty {
            return Sign.zero + Sign.dot
        }
        return currentText + Sign.dot
    }
    
    func isZero(_ input: String) -> Bool {
        return input == Sign.zero ? true : false
    }
    
    func changedSign(_ input: String) -> String {
        if input.contains(Sign.minus) {
            return input.replacingOccurrences(of: Sign.minus, with: Sign.empty)
        }
        return (Sign.minus + input)
    }
    
    func calculate(with expression: String) -> Double {
        var formula = ExpressionParser.parse(from: expression.split(separator: ",").joined())
        return formula.result()
    }
}
