//
//  OperandFormatter.swift
//  Calculator
//
//  Created by Zion & Dasan on 2023/06/14.
//

import Foundation

struct OperandFormatter {
    private let numberFormatter: NumberFormatter
    
    init(_ numberFormatter: NumberFormatter) {
        self.numberFormatter = numberFormatter
    }
    
    func setUpInputOperandText(_ currentOperand: String, _ insertedNumber: String) -> String? {
        guard checkOverMaximumDigits(currentOperand, insertedNumber) == false,
              checkOverMaximumFractionDigits(currentOperand, insertedNumber) == false else { return nil }
        
        return setUpChangedOperandFormat(currentOperand, insertedNumber)
    }
    
    func makeRefinementArithmeticOperand(_ currentOperandLabelText: String?) -> String? {
        guard let currentOperandString = currentOperandLabelText?.withoutDecimalPoint, let operand = Double(currentOperandString) else { return nil }
        
        let isDecimalPointNumber = operand != floor(operand)
        
        return isDecimalPointNumber ? "\(operand)" : "\(Int(operand))"
    }
}

// MARK: - setUpInputOperandText
extension OperandFormatter {
    private func setUpChangedOperandFormat(_ currentOperand: String, _ insertedNumber: String) -> String? {
        let isSubstitutionOperand = (Int(currentOperand) == NumberConstraints.initialNumber) && (insertedNumber != ".")
        
        if isSubstitutionOperand {
            return "\(Int(insertedNumber) ?? NumberConstraints.initialNumber)"
        }
        
        if insertedNumber == "." {
            let operandAsFormatter = numberFormatter.convertToFormatterString(string: currentOperand)
            
            return currentOperand.contains(".") ? operandAsFormatter : operandAsFormatter + "."
        }
        
        if currentOperand.contains(".") && Double(insertedNumber) == 0.0 {
            let operand = currentOperand.components(separatedBy: ".")
            let operandAsInteger = numberFormatter.convertToFormatterString(string: operand.first ?? "")
            let operandFractionNumber = operand.last ?? ""
            
            return operandAsInteger + "." + operandFractionNumber + insertedNumber
        }
        
        return numberFormatter.convertToFormatterString(string: currentOperand + insertedNumber)
    }
}

// MARK: - Check Numbers
extension OperandFormatter {
    private func checkOverMaximumDigits(_ currentOperand: String, _ insertedNumber: String) -> Bool {
        let operand = currentOperand.replacingOccurrences(of: ".", with: "")
        let appendedOperandCount = (operand + insertedNumber).count
        
        return appendedOperandCount > NumberConstraints.maximumOperandDigits
    }
    
    private func checkOverMaximumFractionDigits(_ currentOperand: String, _ insertedNumber: String) -> Bool {
        guard currentOperand.contains(".") else { return false }
        guard let fractionNumber = currentOperand.components(separatedBy: ".").last else { return false }
        
        let appendedFractionNumber = (fractionNumber + insertedNumber).count
        
        return appendedFractionNumber > NumberConstraints.maximumFractionDigits
    }
}
