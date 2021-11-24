//
//  CalculatorManager.swift
//  Calculator
//
//  Created by 1 on 2021/11/24.
//

import Foundation

struct CalculatorManager {
    private(set) var operand: String = "0"
    private(set) var `operator`: String = ""
    private(set) var expression: String = ""
    private(set) var isCalculated = false
    
    private let maximumDigitsOfDoubleExpression = 16
    private let limitedDigitsOfExpression = 20
    
    let formatter = Formatter()
    
    mutating func resetOperand() {
        operand = "0"
    }
    
    mutating func reset() {
        `operator` = ""
        expression = ""
        isCalculated = false
    }
    
    mutating func fetchOperand(input: String) {
        let digitsCount = operand.filter { $0.isNumber }.count
        
        guard digitsCount < limitedDigitsOfExpression else {
            return
        }
        
        if operand == "0" && !["0","00"].contains(input) {
            operand = input
            return
        } else if operand == "0" && ["0","00"].contains(input) {
            return
        }
        
        operand += input
    }
    
    func isNumberOverMaximumExpression(number: Double) -> Bool {
        return abs(number) >= pow(10, Double(maximumDigitsOfDoubleExpression))
    }
    
    func addCommaOnEveryThreeDigits(to input: String) -> String? {
        guard let doubleValue = Double(input) else {
            return nil
        }

        guard let result = formatter.string(from: NSNumber(value: doubleValue)) else {
            return nil
        }
        
        return result
    }
    
    func splitWithIntegerAndFraction(from input: String) -> (integer: String, fraction: String) {
        var integerDigits = input
        var fractionDigits = ""
        
        if input.contains(".") {
            let splited = input.split(with: ".")
            integerDigits = splited.first ?? ""
            fractionDigits = splited.last ?? ""
        }
        
        return (integerDigits, fractionDigits)
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
