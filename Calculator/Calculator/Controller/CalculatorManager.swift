//
//  CalculatorManager.swift
//  Calculator
//
//  Created by 1 on 2021/11/24.
//

import Foundation

struct CalculatorManager {
    private(set) var operand: String = "0"
    private(set) var `operator`: String = ""
    private(set) var expression: String = ""
    private(set) var isCalculated = false
    
    mutating func resetOperand() {
        operand = "0"
    }
    
    mutating func reset() {
        `operator` = ""
        expression = ""
        isCalculated = false
    }
}
