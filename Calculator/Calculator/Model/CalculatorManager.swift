//
//  CalculatorManager.swift
//  Calculator
//
//  Created by mint, Whales on 2023/06/15.
//

import Foundation

struct CalculatorManager {
    private var isZeroButtonUsed = true
    private var isCalculated = false
    private var formulasUntilNow = ""
    
    mutating func verifyButton(for number: String, currentLabel: String) -> String? {
        switch number {
        case "0", "00":
            return verifyZeroButton(currentLabel: currentLabel, buttonNumber: number)
        case ".":
            return verifyDotButton(currentLabel: currentLabel, buttonText: number)
        default:
            return verifyOperandLabel(currentLabel: currentLabel, buttonNumber: number)
        }
    }
    
    mutating func verifyActionButton(for action: String, currentLabel: String) -> String? {
        switch action {
        case "sign":
            return verifySignButton(currentLabel: currentLabel)
        case "result":
            return verifyResultButton(currentLabel: currentLabel)
        default :
            return verifyOperatorButton(currentLabel: currentLabel, button: action)
        }
    }
    
    mutating func clearEntryButton() {
        if formulasUntilNow.isEmpty {
            isZeroButtonUsed = true
        } else {
            isZeroButtonUsed = false
        }
        
        isCalculated = false
    }
    
    mutating func allClearButton() {
        formulasUntilNow = ""
        isCalculated = false
        isZeroButtonUsed = true
    }
    
    private func verifyOperandLabel(currentLabel: String, buttonNumber: String) -> String? {
        guard isCalculated == false,
              (currentLabel + buttonNumber).count <= 20 else {
            return nil
        }
        
        guard currentLabel != "0" else {
            return buttonNumber
        }
        
        return FormManager.transformResult(from: currentLabel + buttonNumber)
    }
    
    private mutating func verifyZeroButton(currentLabel: String, buttonNumber: String) -> String? {
        guard currentLabel != "0" else {
            isZeroButtonUsed = true
            return "0"
        }
        
        guard isCalculated == false,
              (currentLabel + buttonNumber).count <= 20 else {
            return nil
        }
        
        if currentLabel.contains(".") {
            return currentLabel + buttonNumber
        } else {
            return FormManager.transformResult(from: (currentLabel + buttonNumber))
        }
    }
    
    private func verifyDotButton(currentLabel: String, buttonText: String) -> String? {
        guard currentLabel.contains(".") == false,
              isCalculated == false else {
            return nil
        }
    
        return currentLabel + buttonText
    }
    
    private mutating func verifyOperatorButton(currentLabel: String, button: String) -> String? {
        guard currentLabel != "0" || isZeroButtonUsed else {
            return nil
        }
        
        addFormula(currentLabel: currentLabel, button: button)
        
        isCalculated = false
        isZeroButtonUsed = false
        
        return button
    }
    
    private mutating func verifyResultButton(currentLabel: String) -> String? {
        guard isCalculated == false,
              formulasUntilNow.isEmpty == false else {
            return nil
        }
        
        addFormula(currentLabel: currentLabel)
        
        var formula = ExpressionParser.parse(from: formulasUntilNow)
        
        isCalculated = true
        isZeroButtonUsed = true
        formulasUntilNow.removeAll()
        
        return FormManager.transformResult(from: String(formula.result()))
    }
    
    private func verifySignButton(currentLabel: String) -> String? {
        guard currentLabel != "0",
              isCalculated == false else {
            return nil
        }
        
        guard currentLabel.contains("-") else {
            return "-" + currentLabel
        }
        
        return currentLabel.replacingOccurrences(of: "-", with: "")
    }
    
    private mutating func addFormula(currentLabel: String, button: String = "") {
        let operandText = FormManager.transformResult(from: (currentLabel)).replacingOccurrences(of: ",", with: "")
        
        formulasUntilNow += " \(button) \(operandText) "
    }
}
