//
//  CalculatorController.swift
//  Calculator
//
//  Created by Eunsoo KIM on 2021/11/17.
//

import Foundation

class CalculatorController {
    private var numericalExpression = ""
    
    func insertFormula(`operator`: String, operand: String) {
        numericalExpression = numericalExpression + `operator` + String(ExpressionParser.separator)
                            + operand + String(ExpressionParser.separator)
    }
    
    func resetFormula() {
        numericalExpression = ""
    }
    
    func calculate() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .halfUp
        
        var calculatedResult = 0.0
        var formula = ExpressionParser.parse(from: numericalExpression)
        do {
            calculatedResult = try formula.result()
        } catch {
            return Formula.FormulaError.NaN.description
        }

        guard let result = numberFormatter.string(from: NSNumber(value: calculatedResult)) else {
            return ""
        }
        return result
    }
}
