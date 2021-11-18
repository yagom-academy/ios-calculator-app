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
    
    private var currentState: (String, String, Bool, [(String, String)]) {
        (currentOperator, currentOperand, isPositive, formulaStack)
    }
}

// MARK:- Receiving Events
extension Calculator {
    func shouldSetInitialState() {
        toInitialState()
    }
    func allClearButtonDidTap() {
        toInitialState()
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
        validator.zeroValidity(at: currentState) ?
            currentOperator.append("0") : ()
    }
    func doubleZeroButtonDidTap() {
        validator.zeroValidity(at: currentState) ?
            currentOperator.append("00") : ()
    }
    func digitButtonDidTap(number: String) {
        
    }
}

//MARK:- Private Methods
private extension Calculator {
    func toInitialState() {
        formulaStack.removeAll()
        currentOperator.removeAll()
        currentOperand.toZero()
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
