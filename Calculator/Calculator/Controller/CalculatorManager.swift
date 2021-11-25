//
//  CalculatorManager.swift
//  Calculator
//
//  Created by 1 on 2021/11/24.
//

import Foundation

struct CalculatorManager {
    private(set) var currentOperand: String = "0"
    private(set) var currentOperator: String = ""
    private(set) var expression: String = ""
    private(set) var isCalculated = false
    var isOperandContainsDot: Bool {
        return currentOperand.contains(".")
    }
    
    private let maximumDigitsOfDoubleExpression = 16
    private let limitedDigitsOfExpression = 20
    
    let formatter = Formatter()
    
    mutating func resetOperand() {
        currentOperand = "0"
    }
    
    mutating func reset() {
        currentOperator = ""
        expression = ""
        resetIsCalculated()
    }
    
    mutating func resetIsCalculated() {
        isCalculated = false
    }
    
    mutating func fetchOperand(input: String) {
        let digitsCount = currentOperand.filter { $0.isNumber }.count
        
        guard digitsCount < limitedDigitsOfExpression else {
            return
        }
        
        if currentOperand == "0" && !["0","00"].contains(input) {
            currentOperand = input
            return
        } else if currentOperand == "0" && ["0","00"].contains(input) {
            return
        }
        
        currentOperand += input
    }
    
    func isNumberOverMaximumExpression(number: Double) -> Bool {
        return abs(number) >= pow(10, Double(maximumDigitsOfDoubleExpression))
    }
    
    func addCommaOnEveryThreeDigits(to operand: String) -> String? {
        guard let doubleValue = Double(operand) else {
            return nil
        }

        guard let result = formatter.string(from: NSNumber(value: doubleValue)) else {
            return nil
        }
        
        return result
    }
    
    func splitWithIntegerAndFraction(from operand: String) -> (integer: String, fraction: String) {
        var integerDigits = operand
        var fractionDigits = ""
        
        if operand.contains(".") {
            let separated = operand.split(with: ".")
            integerDigits = separated.first ?? ""
            fractionDigits = separated.last ?? ""
        }
        
        return (integerDigits, fractionDigits)
    }
    
    mutating func toggleOperandSign(from operand: inout String) {
        if operand.contains("-") {
            operand.remove(at: operand.startIndex)
            self.currentOperand.remove(at: operand.startIndex)
        } else {
            operand.insert("-", at: operand.startIndex)
            self.currentOperand.insert("-", at: operand.startIndex)
        }
    }
    
    mutating func fetchExpression(operand: String, operator: String) {
        expression.append(operand)
        expression.append(`operator`)
    }
    
    func currentOperandToDouble() -> Double? {
        return Double(self.currentOperand)
    }
    
    mutating func doCalculate() throws -> Double {
        self.isCalculated = true
        let formula = ExpressionParser.parse(from: self.expression)
        
        let calculationResult = try formula.result()
        return calculationResult
    }
}

extension CalculatorManager {
    class Formatter: NumberFormatter {
        override init() {
            super.init()
            self.numberStyle = .decimal
            self.usesSignificantDigits = true
            self.maximumSignificantDigits = 20
            self.roundingMode = .halfUp
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
    }
}
