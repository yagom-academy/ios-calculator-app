//
//  Calculator.swift
//  Calculator
//
//  Created by junho lee on 2022/10/03.
//

import Foundation

struct Calculator {
    static let defaultOperand: String = "0"
    static let defaultOperator: String = ""
    static let negativeSymbol: String = "-"
        
    private(set) var currentOperand: String = defaultOperand
    private(set) var currentOperator: String = defaultOperator
    private var operands: [String] = []
    private var operators: [String] = []
    
    mutating func resetCurrentOperand() {
        currentOperand = Calculator.defaultOperand
    }
    
    mutating func resetCurrentOperator() {
        currentOperator = Calculator.defaultOperator
    }
    
    mutating func clearOperands() {
        operands.removeAll()
    }
    
    mutating func clearOperators() {
        operators.removeAll()
    }
    
    mutating func inputOperand(_ input: String) {
        guard input != CalculateError.dividedByZero.localizedDescription else {
            currentOperand = input
            return
        }
        
        let isPointDuplication: Bool = input == "." && currentOperand.contains(".")
        let isZeroDuplication: Bool = currentOperand == Calculator.defaultOperand && ["0", "00"].contains(input)
        if isZeroDuplication || isPointDuplication {
            return
        }
        
        let isInitialState: Bool = currentOperand == Calculator.defaultOperand && input != "."
        if isInitialState {
            currentOperand = input
        } else {
            currentOperand = applyFormat(to: "\(removeComma(currentOperand))\(input)")
        }
    }
    
    mutating func inputOperator(_ input: String) -> Bool {
        currentOperator = input
        let isEditing: Bool = currentOperand != Calculator.defaultOperand
        let isNotNanError: Bool = currentOperand != CalculateError.dividedByZero.localizedDescription
        guard isEditing, isNotNanError else {
            return false
        }
        operators.append(currentOperator)
        operands.append(currentOperand)
        resetCurrentOperand()
        return true
    }
    
    mutating func switchPositiveNegativeOfCurrentOperand() {
        guard currentOperand != Calculator.defaultOperand else {
            return
        }
        let isNegative: Bool = currentOperand.hasPrefix(Calculator.negativeSymbol)
        if isNegative {
            currentOperand.removeFirst()
        } else {
            currentOperand = "\(Calculator.negativeSymbol)\(currentOperand)"
        }
    }
    
    mutating func inputEqual() -> String? {
        let isInitialState: Bool = operators.isEmpty
        if isInitialState {
            return nil
        }
        operands.append(currentOperand)
        resetCurrentOperand()
        resetCurrentOperator()
        return result()
    }
    
    mutating func result() -> String {
        var result: String = ""
        
        var formula: Formula = ExpressionParser.parse(from: convertOperatorsOperandsToString())
        let formulaResult = formula.result()
        switch formulaResult {
        case .success(let formulaResult):
            if let formulaResult = formulaResult {
                result = applyFormat(to: removeLastCommaZero(String(formulaResult)))
                currentOperand = result
            }
        case .failure(let error):
            result = error.localizedDescription
        }
        
        
        return result
    }
    
    mutating private func convertOperatorsOperandsToString() -> String {
        var result: String = ""
        operands.reverse()
        operators.reverse()
        while operands.isEmpty == false || operators.isEmpty == false {
            if let input: String = operands.popLast() {
                result.append(" \(input)")
            }
            if let input: String = operators.popLast() {
                result.append(" \(input)")
            }
        }
        return result
    }
    
    private func applyFormat(to input: String) -> String {
        let result: String
        let inputNumber: Double = Double.convertStringContainingCommaToDouble(input) ?? 0
        let integerNumber: Int = Int(inputNumber)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        let separatedInput: [String] = input.components(separatedBy: ".")
        let hasDecimalPart: Bool = separatedInput.count >= 2
        guard hasDecimalPart else {
            result = numberFormatter.string(from: NSNumber(value: integerNumber)) ?? ""
            return result
        }
        let decimalPart: String = separatedInput[1]
        let hasOnlyPoint: Bool = decimalPart == ""
        let hasZeroAtTheEnd: Bool = decimalPart.hasSuffix("0")
        if hasOnlyPoint {
            result = numberFormatter.string(from: NSNumber(value: integerNumber)) ?? ""
            return "\(result)."
        } else if hasZeroAtTheEnd {
            result = numberFormatter.string(from: NSNumber(value: integerNumber)) ?? ""
            return "\(result).\(decimalPart)"
        } else {
            result = numberFormatter.string(from: NSNumber(value: inputNumber)) ?? ""
            return result
        }
    }
    
    private func removeComma(_ input: String) -> String {
        return input.replacingOccurrences(of: ",", with: "")
    }
    
    private func removeLastCommaZero(_ input: String) -> String {
        var result: String = input
        if result.hasSuffix(".0") {
            result.removeLast(2)
        }
        return result
    }
}
