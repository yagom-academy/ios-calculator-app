//
//  Calculator.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/18.
//

import Foundation

class Calculator {
    var delegate: CalculatorDelegate?
    private let validator = InputValidator(state: ("", "0", true, []))
    
    private var currentOperator = "" {
        didSet {
            notifyCurrentState()
            delegate?.updateOperatorLabel(with: currentOperator)
        }
    }
    private var currentOperand = "0" {
        didSet {
            notifyCurrentState()
            delegate?.updateOperandLabel(with: currentOperandWithSign)
        }
    }
    private var isPositive = true {
        didSet {
            notifyCurrentState()
            delegate?.updateOperandLabel(with: currentOperandWithSign)
        }
    }
    private var formulaStack = [(operator: String, operand: String)]() {
        didSet {
            notifyCurrentState()
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
    private var currentOperandWithSign: String {
        isPositive ? currentOperand : "-" + currentOperand
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
        validator.toggleSignValidity() ?
            isPositive.toggle() : ()
    }
    func operatorButtonDidTap(operator: String) {
        replaceOperator(with: `operator`)
        guard validator.appendFormulaValidity() else { return }
        formulaStack.append((currentOperator, currentOperandWithSign))
        emptyOperand()
    }
    func equalsButtonDidTap() {
        
    }
    func dotButtonDidTap() {
        validator.dotValidity() ?
            currentOperand.append(".") : ()
    }
    func zeroButtonDidTap() {
        validator.zeroValidity() ?
            currentOperand.append("0") : ()
    }
    func doubleZeroButtonDidTap() {
        validator.zeroValidity() ?
            currentOperand.append("00") : ()
    }
    func digitButtonDidTap(number: String) {
        currentOperand = validator.convertedOperand(from: number)
    }
}

//MARK:- Private Methods
private extension Calculator {
    func toInitialState() {
        formulaStack.removeAll()
        currentOperator.removeAll()
        currentOperand.toZero()
        isPositive = true
    }
    func replaceOperator(with newOperator: String) {
        currentOperator = newOperator
    }
    func emptyOperand() {
        currentOperand.toZero()
        isPositive = true
    }
    func notifyCurrentState() {
        validator.bind(with: currentState)
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
