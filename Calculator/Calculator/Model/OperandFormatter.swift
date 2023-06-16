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
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 11
        numberFormatter.maximumIntegerDigits = 12
        numberFormatter.roundingMode = .halfUp
        
        return numberFormatter.string(for: operandNumber) ?? CalculatorNamespace.empty
    }
    
    static func formatInput(_ operand: String) -> String {
        guard !operand.contains(CalculatorNamespace.comma)
        else {
            return operand
        }
        
        var newOperand: String = operand
        let operandSplit = newOperand.components(separatedBy: CalculatorNamespace.dot)
        
        for (index, item) in operandSplit.enumerated() {
            if index == 0 {
                newOperand = formatStringOperand(item)
            } else {
                newOperand += CalculatorNamespace.dot + item
            }
        }

        return newOperand
    }
    
    static func removeComma(_ operand: String) -> String {
        return operand.replacingOccurrences(of: CalculatorNamespace.comma, with: CalculatorNamespace.empty)
    }
}
