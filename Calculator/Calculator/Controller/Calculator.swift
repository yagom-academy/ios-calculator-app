//
//  Calculator.swift
//  Calculator
//
//  Created by JeongTaek Han on 2021/11/22.
//

import Foundation

struct Calculator {
    private(set) var currentInputOperand = LabelContents.defaultOperand
    private(set) var currentInputOperator = LabelContents.emptyString
    private var isEvaluated = false
    private(set) var mathExpression: [(operatorSymbole: String, operandNumber: String)] = []
    
    mutating func touchNumberButton(_ number: String) {
        if isEvaluated {
            let newOperand = number
            resetAllExpression()
            updateCurrentInput(operandForm: newOperand)
            return
        }
        
        if number == LabelContents.doubleZero && currentInputOperand == LabelContents.defaultOperand { return }
        
        if currentInputOperand == LabelContents.defaultOperand {
            updateCurrentInput(operandForm: number, operatorForm: currentInputOperator)
            return
        }
        
        currentInputOperand += number
    }
    
    mutating func touchOperatorButton(_ operatorSymbole: String) {
        if isEvaluated {
            let newOperand = currentInputOperand
            resetAllExpression()
            mathExpression += [(LabelContents.emptyString, newOperand)]
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
        resetAllExpression()
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
