//
//  CalculatorController.swift
//  Calculator
//
//  Created by Eunsoo KIM on 2021/11/17.
//

import Foundation

class CalculatorController {
    private var storedOperandAndOperator = ""
    
    func insertFormula(`operator`: String, operand: String) {
        storedOperandAndOperator = storedOperandAndOperator + `operator` + String(ExpressionParser.separator)
                            + operand + String(ExpressionParser.separator)
    }
    
    func resetFormula() {
        storedOperandAndOperator = ""
    }
    
    func calculate() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .halfUp
        
        var calculatedResult = 0.0
        
        do {
            calculatedResult = try ExpressionParser.parse(from: storedOperandAndOperator).result()
        } catch {
            return Formula.FormulaError.NaN.description
        }

        guard let result = numberFormatter.string(from: NSNumber(value: calculatedResult)) else {
            return ""
        }
        return result
    }
}
