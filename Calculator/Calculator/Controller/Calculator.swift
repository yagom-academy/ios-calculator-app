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
    
    private var currentOperator = "" {
        didSet { delegate?.updateOperatorLabel(with: currentOperator) }
    }
    private var currentOperand = "0" {
        didSet {
            delegate?.updateOperandLabel(with: isPositive ?
                                            currentOperand : "-" + currentOperand)
        }
    }
    private var isPositive = true {
        didSet {
            delegate?.updateOperandLabel(with: isPositive ?
                                            currentOperand : "-" + currentOperand)
        }
    }
    private var formulaStack = [(operator: String, operand: String)]() {
        didSet {
            guard let latestFormula = formulaStack.last else {
                delegate?.clearFormulaStack()
                return
            }
            delegate?.addFormulaLine(operator: latestFormula.operator,
                                     operand: latestFormula.operand)
        }
    }
    
    var currentState: (String, String, Bool, [(String, String)]) {
        (currentOperator, currentOperand, isPositive, formulaStack)
    }
}

// MARK:- Receiving Events
extension Calculator {
    func shouldSetInitialState() {
        allClearButtonDidTap()
    }
    func allClearButtonDidTap() {
        formulaStack.removeAll()
        currentOperator.removeAll()
        currentOperand.toZero()
    }
    func clearEntryButtonDidTap() {

    }
    func toggleSignButtonDidTap() {
        validator.toggleSignValidity(at: currentState) ?
            isPositive.toggle() : ()
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
    func addFormulaLine(operator: String, operand: String)
    func updateOperatorLabel(with operator: String)
    func updateOperandLabel(with operand: String)
    func clearFormulaStack()
}

// MARK:- String Extension
private extension String {
    mutating func toZero() {
        self = "0"
    }
}
