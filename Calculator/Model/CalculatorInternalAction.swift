//
//  CalculatorInternalAction.swift
//  Calculator
//
//  Created by Baek on 2022/06/01.
//

import Foundation

struct CalculatorInternalAction {
    private var isOperandInputted = false
    private var isCalculateCompleted = false
    private var inputtedFomula = CalculatorDefaultValue.fomula
    
    mutating func setDefaultValue() {
        isOperandInputted = false
        isCalculateCompleted = false
        inputtedFomula = CalculatorDefaultValue.fomula
    }
    
    func changeTheSign(_ text: String?) -> String {
        guard let operandText = text, Double(operandText) != 0.0 else { return CalculatorDefaultValue.operandLabel }
        guard let operand = Double(filterSign(operandText, ",")) else { return CalculatorDefaultValue.operandLabel }
        
        return String((operand * -1).parse())
    }
    
    private func filterSign(_ input: String, _ sign: String.Element) -> String {
        return input.filter{$0 != sign}
    }
}
