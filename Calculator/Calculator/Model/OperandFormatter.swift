//
//  OperandFormatter.swift
//  Calculator
//
//  Created by Min Hyun on 2023/06/13.
//  Last modify : idinaloq, Erick, Maxhyunm

import Foundation

enum OperandFormatter {
    static func formatStringOperand(_ operand: String) -> String {
        let operandNumber = NSDecimalNumber(string: operand)
        return formatNumberToString(operandNumber)
    }
    
    static func formatInput(_ operand: String) -> String {
        guard !operand.contains(CalculatorNamespace.comma)
        else {
            return operand
        }
        
        var newOperand: String = operand
        let operandSplit = newOperand.components(separatedBy: CalculatorNamespace.dot)
        
        guard let operandInteger = operandSplit.first,
              let operandFraction = operandSplit.last
        else {
            return newOperand
        }
        let operandDouble = NSDecimalNumber(string:operandInteger)
        newOperand = formatNumberToString(operandDouble)
        
        if operandSplit.count == 2 {
            newOperand += CalculatorNamespace.dot + operandFraction
        }
        return newOperand
    }
    
    private static func formatNumberToString(_ operand: NSDecimalNumber) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = -2
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.usesSignificantDigits = true
        numberFormatter.roundingMode = .halfUp
        
        guard let numberFormatted = numberFormatter.string(for: operand)
        else {
            return CalculatorNamespace.empty
        }
        return numberFormatted
    }
    
    static func removeComma(_ operand: String) -> String {
        return operand.replacingOccurrences(of: CalculatorNamespace.comma, with: CalculatorNamespace.empty)
    }
}
