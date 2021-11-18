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
    
    private var currentOperand = "0" {
        didSet { delegate?.updateOperandLabel(with: currentOperand) }
    }
    private var currentOperator = "" {
        didSet { delegate?.updateOperatorLabel(with: currentOperator) }
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
}

// MARK:- Receiving Events
extension Calculator {
    func shouldSetInitialState() {
        formulaStack.removeAll()
        currentOperator.removeAll()
        currentOperand.toZero()
    }
    func allClearButtonDidTap() {
        
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
