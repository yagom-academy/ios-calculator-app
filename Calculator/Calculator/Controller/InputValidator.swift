//
//  InputValidator.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/19.
//

import Foundation

class InputValidator {
    typealias CalculatorState = (currentOperator: String,
                                  currentOperand: String,
                                  isPositive: Bool,
                                  formulaStack: [(String, String)])
    
    private func isInitialState(_ state: CalculatorState) -> Bool {
        state.currentOperand == "0"
            && state.currentOperator == ""
            && state.formulaStack.isEmpty
    }
    private func isZero(_ state: CalculatorState) -> Bool {
        state.currentOperand == "0"
    }
    private func isDotted(_ state: CalculatorState) -> Bool { state.currentOperand.contains(".")
    }
    
    func toggleSignValidity(at state: CalculatorState) -> Bool {
        if isZero(state) {
            return false
        } else if state.currentOperand.hasSuffix("."),
                  state.currentOperand.first == "0" {
            return false
        } else if state.currentOperand.filter({ $0 != "0" && $0 != "." }).isEmpty {
            return false
        }
        return true
    }
    func convertedOperand(from digit: String, at state: CalculatorState) -> String {
        isZero(state) ? digit : state.currentOperand + digit
    }
    func zeroValidity(at state: CalculatorState) -> Bool {
        !isZero(state)
    }
    func dotValidity(at state: CalculatorState) -> Bool {
        !isDotted(state)
    }
}
