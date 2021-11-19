//
//  InputValidator.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/19.
//

import Foundation

class InputValidator {
    typealias CalculatorState = (operator: String,
                                 operand: String,
                                 isShowingResult: Bool,
                                 formulaStack: [(String, String)])
    private var state: CalculatorState
    
    init(state: CalculatorState) {
        self.state = state
    }
    
    private var isInitialState: Bool {
        state.operand == "0"
            && state.operator == ""
            && state.formulaStack.isEmpty
    }
    private var isZero: Bool { state.operand == "0" }
    private var isDotted: Bool { state.operand.contains(".") }
    private var isShowingResult: Bool { state.isShowingResult }
    private var hasNoOperator: Bool { state.operator.isEmpty }
    private var isFirstFormula: Bool { state.formulaStack.isEmpty && state.operator.isEmpty }
    
    func bind(with state: CalculatorState) {
        self.state = state
    }
    
    func toggleSignValidity() -> Bool {
        if isZero {
            return false
        } else if state.operand.hasSuffix("."),
                  state.operand.first == "0" {
            return false
        } else if state.operand.filter({ $0 != "0" && $0 != "." }).isEmpty {
            return false
        } else if isShowingResult {
            return false
        }
        return true
    }
    func maintainInputValidity() -> Bool {
        !isShowingResult
    }
    func appendFormulaValidity() -> Bool {
        !isShowingResult && !isZero && !isFirstFormula
    }
    func convertedOperand(from digit: String) -> String {
        isZero ? digit : state.operand + digit
    }
    func zeroValidity() -> Bool {
        !isZero
    }
    func dotValidity() -> Bool {
        !isDotted
    }
    func equalsValidity() -> Bool {
        !isShowingResult && !hasNoOperator
    }
}
