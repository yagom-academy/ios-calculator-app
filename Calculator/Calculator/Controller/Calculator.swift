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
            isOverMaximumDigit()
        }
    }
    private(set) var currentInputOperator = LabelContents.emptyString
    private var isEvaluated = false
    private(set) var mathExpression: [(operatorSymbole: String, operandNumber: String)] = []
    
    mutating func inputNumber(_ number: String) {
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
    
    mutating func inputDot() {
        if currentInputOperand.contains(LabelContents.pointSymbol) { return }
        
        if isEvaluated {
            let newOperand = currentInputOperand + LabelContents.pointSymbol
            resetAllExpression()
            updateCurrentInput(operandForm: newOperand)
            return
        }
        
        currentInputOperand += LabelContents.pointSymbol
    }
    
    mutating func inputOperator(_ operatorSymbole: String) {
        if currentInputOperand == LabelContents.notANumber {
            resetAllExpression()
        }
        
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
    
    mutating func changeSignOfNumber() {
        if currentInputOperand == LabelContents.defaultOperand { return }
        if isEvaluated { return }
        
        if currentInputOperand.hasPrefix(LabelContents.minusSignSymbol) {
            currentInputOperand.removeFirst()
            return
        }
        
        currentInputOperand.insert(contentsOf: LabelContents.minusSignSymbol, at: currentInputOperand.startIndex)
    }
    
    mutating func clearAllExpression() {
        resetAllExpression()
    }
    
    mutating func clearEntry() {
        if isEvaluated {
            resetAllExpression()
            return
        }
        
        updateCurrentInput(operatorForm: currentInputOperator)
    }
    
    mutating func calculateAllExpression() {
        if isEvaluated { return }
        
        mathExpression += [(currentInputOperator, currentInputOperand)]
        
        isEvaluated = true
        let stringFormula = mathExpression.reduce(LabelContents.emptyString) { (previousResult: String, each: (operatorSymbol: String, operandNumber: String)) in
            return previousResult + each.operatorSymbol + each.operandNumber
        }
        
        do {
            var fomula = ExpressionParser.parse(from: stringFormula)
            let result = try fomula.result()
            updateCurrentInput(operandForm: String(result))
        } catch OperandsError.dividedByZero {
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
    
    mutating func isOverMaximumDigit() {
        if currentInputOperand.count >= 15 {
            currentInputOperand.removeLast()
        }
    }
    
    private struct LabelContents {
        static let notANumber = "NaN"
        static let emptyString = ""
        static let defaultOperand = "0"
        static let minusSignSymbol = "-"
        static let pointSymbol = "."
        static let doubleZero = "00"
        static let error = "error"
    }
}
