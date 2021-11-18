//
//  Calculator.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/18.
//

import Foundation

class Calculator {
    var delegate: CalculatorDelegate?
    private let validator = InputValidator()
    
    var currentOperand = "0"
    var currentOperator = ""
    var formulaStack = [(operator: String, operand: String)]()
}

// MARK:- Receiving Events
extension Calculator {
    func allClearButtonDidTap() {
        delegate?.clearToInitialState()
    }
    func clearEntryButtonDidTap() {

    }
    func toggleSignButtonDidTap() {
        
    }
    func operatorButtonDidTap(operator: String) {
        
    }
    func equalsButtonDidTap() {
        
    }
    func dotButtonDidTap() {
        
    }
    func zeroButtonDidTap() {
        
    }
    func doubleZeroButtonDidTap() {
        
    }
    func digitButtonDidTap(number: String) {
        
    }
}

// MARK:- Delegate Requirements
protocol CalculatorDelegate {
    func clearToInitialState()
    func addFormulaLine(operator: String, operand: String)
}
