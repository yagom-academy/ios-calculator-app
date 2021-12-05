//
//  CalculatorManager.swift
//  Calculator
//
//  Created by 1 on 2021/11/24.
//

import Foundation

struct CalculatorManager {
    // MARK: - Properties
    private(set) var currentOperand: String = "0"
    private(set) var currentOperator: String = ""
    private(set) var expression: String = ""
    private(set) var isCalculated = false
    
    var isOperandContainsDot: Bool {
        return currentOperand.contains(".")
    }
    
    var currentOperandDouble: Double? {
        return Double(currentOperand)
    }
    
    private let maximumDigitsOfDoubleExpression = 16
    private let limitedDigitsOfExpression = 20
    
    let formatter = Formatter()
    
    // MARK: - Methods
    mutating func resetCurrentOperand() {
        currentOperand = "0"
    }
    
    mutating func resetIsCalculated() {
        isCalculated = false
    }
    
    mutating func reset() {
        currentOperator = ""
        expression = ""
        resetIsCalculated()
    }
    
    mutating func fetchOperand(with operand: String) {
        let digitsCount = currentOperand.filter { $0.isNumber }.count
        
        guard digitsCount < limitedDigitsOfExpression else {
            return
        }
        
        if currentOperand == "0" && !["0","00", "."].contains(operand) {
            currentOperand = operand
            return
        } else if currentOperand == "0" && ["0","00"].contains(operand) {
            return
        }
        
        currentOperand += operand
    }
    
    mutating func fetchOperator(with operator: String) {
        currentOperator = `operator`
    }
    
    mutating func removeLastExpression() {
        expression.removeLast()
    }
    
    func isNumberOverMaximumExpression(number: Double) -> Bool {
        return abs(number) >= pow(10, Double(maximumDigitsOfDoubleExpression))
    }
    
    func splitToIntegerAndFraction(from operand: String) -> (integer: String, fraction: String) {
        var integerDigits = operand
        var fractionDigits = ""
        
        if operand.contains(".") {
            let separated = operand.split(with: ".")
            integerDigits = separated.first ?? ""
            fractionDigits = separated.last ?? ""
        }
        
        return (integerDigits, fractionDigits)
    }
    
    func addCommaOnEveryThreeDigits(to operand: String) -> String? {
        guard let doubleValue = Double(operand) else {
            return nil
        }

        guard let formattedString = formatter.string(from: NSNumber(value: doubleValue)) else {
            return nil
        }
        
        return formattedString
    }
    
    mutating func toggleOperandSign(from operand: inout String) {
        if operand.contains("-") {
            operand.remove(at: operand.startIndex)
            currentOperand.remove(at: currentOperand.startIndex)
        } else {
            operand.insert("-", at: operand.startIndex)
            currentOperand.insert("-", at: currentOperand.startIndex)
        }
    }
    
    mutating func fetchExpression(operand: String, operator: String) {
        expression.append(operand)
        expression.append(`operator`)
    }
    
    mutating func calculate() throws -> Double {
        isCalculated = true
        let formula = ExpressionParser.parse(from: expression)
        
        let calculationResult = try formula.result()
        return calculationResult
    }
}

// MARK: - NumberFormatter
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
