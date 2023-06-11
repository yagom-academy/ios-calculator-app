//
//  NumberFormatter.swift
//  Calculator
//
//  Created by Min Hyun on 2023/06/09.
//
import Foundation

enum OperandFormatter {
    static func formatStringOperand(_ operand: String) -> String {
        let operandNumber = NSDecimalNumber(string: operand)
        return formatNumberToString(operandNumber)
    }
    
    static func formatInput(_ operand: String) -> String {
        guard let firstDigit = operand.first,
              !operand.contains(",")
        else {
            return operand
        }
        var newOperand: String = operand
        var sign: String = CalculatorNamespace.Empty
        
        if String(firstDigit) == CalculatorNamespace.Negative {
            newOperand = String(newOperand.dropFirst(1))
            sign = CalculatorNamespace.Negative
        }

        if newOperand.count > 20 {
            newOperand = String(newOperand.prefix(20))
        }
        
        newOperand = sign + newOperand
        let operandSplit = newOperand.components(separatedBy: CalculatorNamespace.Dot)
        
        guard let operandInteger = operandSplit.first,
              let operandFraction = operandSplit.last
        else {
            return newOperand
        }
        let operandDouble = NSDecimalNumber(string:operandInteger)
        newOperand = formatNumberToString(operandDouble)
        
        if operandSplit.count == 2 {
            newOperand += CalculatorNamespace.Dot + operandFraction
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
            return CalculatorNamespace.Empty
        }
        return numberFormatted
    }
    
    static func removeComma(_ operand: String) -> String {
        return operand.replacingOccurrences(of: ",", with: "")
    }
}
