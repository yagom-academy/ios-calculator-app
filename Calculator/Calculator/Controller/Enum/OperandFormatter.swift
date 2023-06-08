//
//  NumberFormatter.swift
//  Calculator
//
//  Created by Min Hyun on 2023/06/09.
//
import Foundation

enum OperandFormatter {
    static func formatDoubleToString(_ operand: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .halfUp
        
        guard let numberFormatted = numberFormatter.string(for: operand)
        else {
            return MultiUseString.empty.value
        }
        
        return numberFormatted
    }
    
    static func formatStringToString(_ operand: String) -> String {
        guard let doubleOperand = Double(operand),
              !operand.contains(",")
        else {
            return operand
        }
        return formatDoubleToString(doubleOperand)
    }
    
    static func removeComma(_ operand: String) -> String {
        return operand.replacingOccurrences(of: ",", with: "")
    }
}
