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
            return verifyZeroButton(currentLabel, number)
        case ".":
            return verifyDotButton(currentLabel, number)
        default:
            return verifyOperandLabel(currentLabel, number)
        }
    }
    
    mutating func verifyActionButton(for action: String, currentLabel: String) -> String? {
        switch action {
        case "sign":
            return verifySignButton(currentLabel)
        case "result":
            return verifyResultButton(currentLabel)
        default :
            return verifyOperatorButton(currentLabel, action)
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
    
    private func verifyOperandLabel(_ currentLabelText: String, _ buttonText: String) -> String? {
        guard isCalculated == false,
              (currentLabelText + buttonText).count <= 20 else {
            return nil
        }
        
        guard currentLabelText != "0" else {
            return buttonText
        }
        
        return FormManager.transformResult(from: currentLabelText + buttonText)
    }
    
    private mutating func verifyZeroButton(_ currentLabelText: String, _ buttonText: String) -> String? {
        guard currentLabelText != "0" else {
            isZeroButtonUsed = true
            return "0"
        }
        
        guard isCalculated == false,
              (currentLabelText + buttonText).count <= 20 else {
            return nil
        }
        
        if currentLabelText.contains(".") {
            return currentLabelText + buttonText
        } else {
            return FormManager.transformResult(from: (currentLabelText + buttonText))
        }
    }
    
    private func verifyDotButton(_ currentLabelText: String, _ buttonText: String) -> String? {
        guard currentLabelText.contains(".") == false,
              isCalculated == false else {
            return nil
        }
    
        return currentLabelText + buttonText
    }
    
    private mutating func verifyOperatorButton(_ currentLabelText: String, _ buttonText: String) -> String? {
        guard currentLabelText != "0" || isZeroButtonUsed else {
            return nil
        }
        
        addFormula(currentLabelText, buttonText)
        
        isCalculated = false
        isZeroButtonUsed = false
        
        return buttonText
    }
    
    private mutating func verifyResultButton(_ currentLabelText: String) -> String? {
        guard isCalculated == false,
              formulasUntilNow.isEmpty == false else {
            return nil
        }
        
        addFormula(currentLabelText)
        
        var formula = ExpressionParser.parse(from: formulasUntilNow)
        
        isCalculated = true
        isZeroButtonUsed = true
        formulasUntilNow.removeAll()
        
        return FormManager.transformResult(from: String(formula.result()))
    }
    
    private func verifySignButton(_ currentLabelText: String) -> String? {
        guard currentLabelText != "0",
              isCalculated == false else {
            return nil
        }
        
        guard currentLabelText.contains("-") else {
            return "-" + currentLabelText
        }
        
        return currentLabelText.replacingOccurrences(of: "-", with: "")
    }
    
    private mutating func addFormula(_ currentLabelText: String, _ buttonText: String = "") {
        let operandText = FormManager.transformResult(from: (currentLabelText)).replacingOccurrences(of: ",", with: "")
        
        formulasUntilNow += " \(buttonText) \(operandText) "
    }
}
