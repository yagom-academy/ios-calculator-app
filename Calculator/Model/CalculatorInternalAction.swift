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
}
