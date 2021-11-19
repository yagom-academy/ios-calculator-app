//
//  Calculator.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/18.
//

import Foundation

class Calculator {
    var delegate: CalculatorDelegate?
    private let validator = InputValidator(state: ("", "0", false, []))
    
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
    private var isShowingResult = false {
        didSet { notifyCurrentState() }
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
        (currentOperator, currentOperand, isShowingResult, formulaStack)
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
        currentOperand.toZero()
    }
    func toggleSignButtonDidTap() {
        guard validator.toggleSignValidity() else { return }
        isPositive.toggle()
    }
    func operatorButtonDidTap(operator: String) {
        guard validator.maintainInputValidity() else {
            toInitialState()
            operatorButtonDidTap(operator: `operator`)
            return
        }
        guard validator.appendFormulaValidity() else { return }
        formulaStack.append((currentOperator, currentOperandWithSign))
        replaceOperator(with: `operator`)
        emptyOperand()
    }
    func equalsButtonDidTap() {
        guard validator.equalsValidity(),
              let result = formattedResult() else { return }
        formulaStack.append((currentOperator, currentOperandWithSign))
        replaceOperator(with: "")
        currentOperand = result
        isShowingResult = true
    }
    func dotButtonDidTap() {
        guard validator.dotValidity() else { return }
        currentOperand.append(".")
    }
    func zeroButtonDidTap() {
        guard validator.maintainInputValidity() else {
            toInitialState()
            isShowingResult = false
            zeroButtonDidTap()
            return
        }
        guard validator.zeroValidity() else { return }
        currentOperand.append("0")
    }
    func doubleZeroButtonDidTap() {
        guard validator.maintainInputValidity() else {
            toInitialState()
            isShowingResult = false
            doubleZeroButtonDidTap()
            return
        }
        guard validator.zeroValidity() else { return }
        currentOperand.append("00")
    }
    func digitButtonDidTap(number: String) {
        guard validator.maintainInputValidity() else {
            toInitialState()
            isShowingResult = false
            digitButtonDidTap(number: number)
            return
        }
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
        isShowingResult = false
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

// MARK:- Calculate
private extension Calculator {
    var formulaToString: String {
        formulaStack.reduce("") { $0 + $1.operator + $1.operand }
            + currentOperator + currentOperand
    }
    var calculated: Double {
        var parsed = ExpressionParser.parse(from: formulaToString)
        return parsed.result()
    }
    func formattedResult() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumSignificantDigits = 20
        formatter.roundingMode = .up
        
        return formatter.string(for: calculated)
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
