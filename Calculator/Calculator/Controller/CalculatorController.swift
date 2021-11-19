//
//  CalculatorController.swift
//  Calculator
//
//  Created by Eunsoo KIM on 2021/11/17.
//

import Foundation

class CalculatorController {
    private var formula = ""
    
    func insertFormula(`operator`: String, operand: String) {
        formula = formula + `operator` + String(ExpressionParser.separator)
                            + operand + String(ExpressionParser.separator)
    }
    
    func resetFormula() {
        formula = ""
    }
    
    func calculate() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .halfUp
        
        var calculatedResult = 0.0
        
        do {
            calculatedResult = try ExpressionParser.parse(from: formula).result()
        } catch {
            return Formula.FormulaError.NaN.description
        }

        guard let result = numberFormatter.string(from: NSNumber(value: calculatedResult)) else {
            return ""
        }
        return result
    }
}
