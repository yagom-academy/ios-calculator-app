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
    
    //123456789
    //현재까지의 피연산자 라벨 + 눌러진 숫자 데이터 받음
    //입력 가능한지 아닌지. 옵셔널로 반환
    //가능하면 String 아니면 nil
    func verifyOperandLabel(currentLabel: String, buttonNumber: String) -> String? {
        guard isCalculated == false,
              (currentLabel + buttonNumber).count <= 20 else {
            return nil
        }
        
        guard currentLabel != "0" else {
            return buttonNumber
        }
        return FormManager.transformResult(from: currentLabel + buttonNumber)
    }
    //0 혹은 00
    //입력 가능한지 아닌지 옵셔널로 반환
    //가능하면 String, 아니면 nil
    mutating func verifyZeroButton(currentLabel: String, buttonNumber: String) -> String? {
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
    //dot
    //옵셔널로 반환?
    func verifyDotButton(currentLabel: String, buttonText: String) -> String? {
        guard currentLabel.contains(".") == false,
              isCalculated == false else {
            return nil
        }
    
        return currentLabel + buttonText
    }
    
    mutating func verifyOperatorButton(currentLabel: String, button: String) -> String? {
        guard currentLabel != "0" ||  isZeroButtonUsed else {
            return nil
        }
        
        addFormula(currentLabel: currentLabel, button: button)
        
        isCalculated = false
        isZeroButtonUsed = false
        
        return button
    }
    
    mutating func verifyResultButton(currentLabel: String) -> String? {
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
    
    func verifySignButton(currentLabel: String) -> String? {
        guard currentLabel != "0",
              isCalculated == false else {
            return nil
        }
        
        guard currentLabel.contains("-") else {
            return "-" + currentLabel
        }
        
        return currentLabel.replacingOccurrences(of: "-", with: "")
    }
    
    mutating func clearButton() {
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
    
    private mutating func addFormula(currentLabel: String, button: String = "") {
        let operandText = FormManager.transformResult(from: (currentLabel)).replacingOccurrences(of: ",", with: "")
        
        formulasUntilNow += " \(button) \(operandText) "
    }
}
