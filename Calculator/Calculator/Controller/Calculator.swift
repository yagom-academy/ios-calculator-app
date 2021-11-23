//
//  Calculator.swift
//  Calculator
//
//  Created by JeongTaek Han on 2021/11/22.
//

import Foundation

struct Calculator {
    private(set) var currentInputOperand = LabelContents.defaultOperand {
        didSet {
            if isEvaluated && currentInputOperand.hasSuffix(".0") {
                guard let index = currentInputOperand.firstIndex(of: Character(LabelContents.pointSymbole)) else { return }
                    currentInputOperand = String(currentInputOperand[..<index])
            }
        }
    }
    private(set) var currentInputOperator = LabelContents.emptyString
    
    private var isEvaluated = false
    private(set) var mathExpression: [(operatorSymbole: String, operandNumber: String)] = []
    
    mutating func touchNumberButton(_ number: String) {
        if isEvaluated {
            let temporaryOperand = currentInputOperand + number
            resetAllExpression()
            updateCurrentInput(operandForm: temporaryOperand)
            return
        }
        
        if number == LabelContents.doubleZero && currentInputOperand == LabelContents.defaultOperand { return }
        
        if currentInputOperand == LabelContents.defaultOperand {
            updateCurrentInput(operandForm: number, operatorForm: currentInputOperator)
            return
        }
        
        currentInputOperand += number
    }
    
    mutating func touchPointButton() {
        if currentInputOperand.contains(LabelContents.pointSymbole) { return }
        
        if isEvaluated {
            let temporaryOperand = currentInputOperand + LabelContents.pointSymbole
            resetAllExpression()
            updateCurrentInput(operandForm: temporaryOperand)
            return
        }
        
        currentInputOperand += LabelContents.pointSymbole
    }
    
    mutating func touchOperatorButton(_ operatorSymbole: String) {
        if isEvaluated {
            let temporaryOperand = currentInputOperand
            resetAllExpression()
            mathExpression += [(LabelContents.emptyString, temporaryOperand)]
            updateCurrentInput(operatorForm: operatorSymbole)
            return
        }
        
        if currentInputOperand == LabelContents.defaultOperand && mathExpression.isEmpty { return }
        
        if currentInputOperand == LabelContents.defaultOperand {
            updateCurrentInput(operandForm: currentInputOperand, operatorForm: operatorSymbole)
            return
        }
        
        if mathExpression.isEmpty {
            mathExpression += [(LabelContents.emptyString, currentInputOperand)]
            updateCurrentInput(operatorForm: operatorSymbole)
            return
        }
        
        mathExpression += [(currentInputOperator, currentInputOperand)]
        updateCurrentInput(operatorForm: operatorSymbole)
    }
    
    mutating func touchSignChangeButton() {
        if currentInputOperand == LabelContents.defaultOperand { return }
        if isEvaluated { return }
        
        if currentInputOperand.hasPrefix(LabelContents.minusSignSymbole) {
            currentInputOperand.removeFirst()
            return
        }
        
        currentInputOperand.insert(contentsOf: LabelContents.minusSignSymbole, at: currentInputOperand.startIndex)
    }
    
    mutating func touchAllClearButton() {
        resetAllExpression()
    }
    
    mutating func touchClearEntryButton() {
        if isEvaluated == false {
            updateCurrentInput(operatorForm: currentInputOperator)
            return
        }
        
        resetAllExpression()
    }
    
    mutating func touchEvaluateButton() {
        if isEvaluated { return }
        
        mathExpression += [(currentInputOperator, currentInputOperand)]
        
        isEvaluated = true
        let stringFormula = mathExpression.reduce(LabelContents.emptyString) { (previousResult, each) in
            return previousResult + each.operatorSymbole + each.operandNumber
        }
        
        do {
            let result = try ExpressionParser.parse(from: stringFormula).result()
            updateCurrentInput(operandForm: String(result))
        } catch CalculatorError.divideByZero {
            updateCurrentInput(operandForm: LabelContents.notANumber)
        } catch {
            updateCurrentInput(operandForm: LabelContents.error)
        }
    }
    
    
    mutating private func updateCurrentInput(operandForm: String = LabelContents.defaultOperand, operatorForm: String = LabelContents.emptyString) {
        currentInputOperator = operatorForm
        currentInputOperand = operandForm
    }
    
    mutating private func resetAllExpression() {
        updateCurrentInput()
        mathExpression = []
        isEvaluated = false
    }
    
    private struct LabelContents {
        static let notANumber = "NaN"
        static let emptyString = ""
        static let defaultOperand = "0"
        static let minusSignSymbole = "-"
        static let pointSymbole = "."
        static let doubleZero = "00"
        static let error = "error"
    }
}
