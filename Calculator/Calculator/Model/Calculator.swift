//
//  Calculator.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/25.
//

import Foundation

struct Calculator: Calculatable {
    var formulaStack: [String] = []
    var currentOperand = ""
    var currentOperator = ""
    
    var currentOperandIsZero: Bool {
        return currentOperand == "0"
    }
    
    var currentOperandIsNotZero: Bool {
        return currentOperand != "0"
    }
    
    var historyStackIsNotEmpty: Bool {
        return !formulaStack.isEmpty
    }
    
    mutating func clearHistoryStack() {
        formulaStack.removeAll()
    }
    
    mutating func updateCurrentOperandValue(to newOperand: String) {
        currentOperand = newOperand
    }
    
    mutating func updateCurrentOperatorValue(to newOperator: String) {
        currentOperator = newOperator
    }
    
    mutating func updateFormulaList() {
        formulaStack.append(contentsOf: [currentOperator, currentOperand])
    }
    
    func calculateResult() -> Double {
        let equationString = formulaStack.filter { $0 != "" }
            .joined()
        var formula = ExpressionParser.parse(from: equationString)
        let result = getCalculationResult(from: &formula)
        
        return result
    }

    func getCalculationResult(from formula: inout Formula) -> Double {
        var result = 0.0
        do {
            try result = formula.result()
        } catch let error as CalculateItemQueueError {
            print(error.errorDescription)
        } catch {
            print(error)
        }
         
        return result
    }
}
