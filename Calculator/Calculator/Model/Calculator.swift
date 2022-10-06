//
//  Calculator.swift
//  Calculator
//
//  Created by junho lee on 2022/10/03.
//

import Foundation

struct Calculator {
    private let defaultOperand: String = "0"
    private let defaultOperator: String = ""
    private let negativeSymbol: String = "-"
    private(set) var currentOperand: String
    private(set) var currentOperator: String
    private var operands: [String] = []
    private var operators: [String] = []
    var isEditingState: Bool {
        get {
            return currentOperand != defaultOperand
        }
    }
    var isEmpty: Bool {
        get {
            operands.isEmpty && operators.isEmpty
        }
    }
    
    init() {
        currentOperand = defaultOperand
        currentOperator = defaultOperator
    }
    
    mutating func resetCurrentOperand() {
        currentOperand = defaultOperand
    }
    
    mutating func resetCurrentOperator() {
        currentOperator = defaultOperator
    }
    
    mutating func clearOperands() {
        operands.removeAll()
    }
    
    mutating func clearOperators() {
        operators.removeAll()
    }
    
    mutating func inputOperand(_ input: String) {
        let isPointDuplication: Bool = input == "." && currentOperand.contains(".")
        let isZeroDuplication: Bool = currentOperand == defaultOperand && ["0", "00"].contains(input)
        if isZeroDuplication || isPointDuplication {
            return
        }
        let isInitialState: Bool = currentOperand == defaultOperand && input != "."
        if isInitialState {
            currentOperand = input
        } else {
            currentOperand = applyFormat(to: "\(removeComma(currentOperand))\(input)")
        }
    }
    
    mutating func inputOperator(_ input: String) {
        currentOperator = input
        guard isEditingState else {
            return
        }
        operators.append(currentOperator)
        operands.append(currentOperand)
        resetCurrentOperand()
    }
    
    mutating func switchPositiveNegativeOfCurrentOperand() {
        guard currentOperand != defaultOperand else {
            return
        }
        let isNegative: Bool = currentOperand.hasPrefix(negativeSymbol)
        if isNegative {
            currentOperand.removeFirst()
        } else {
            currentOperand = "\(negativeSymbol)\(currentOperand)"
        }
    }
    
    mutating func inputEqual() throws -> String? {
        let isInitialState: Bool = operators.isEmpty
        if isInitialState {
            return nil
        }
        operands.append(currentOperand)
        resetCurrentOperand()
        resetCurrentOperator()
        return try result()
    }
    
    mutating func result() throws -> String {
        var formula: Formula = ExpressionParser.parse(from: convertOperatorsOperandsToString())
        guard let formulaResult = try formula.result() else {
            return ""
        }
        currentOperand = applyFormat(to: removeLastCommaZero(String(formulaResult)))
        return currentOperand
    }
    
    mutating private func convertOperatorsOperandsToString() -> String {
        var result: String = ""
        operands.reverse()
        operators.reverse()
        while isEmpty == false {
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
        let inputNumber: Double = Converter().convertStringContainingCommaToDouble(input) ?? 0
        let integerPartNumber: Double = floor(inputNumber)
        let separatedInput: [String] = input.components(separatedBy: ".")
        let hasDecimalPart: Bool = separatedInput.count >= 2
        guard hasDecimalPart else {
            return applyNumberFormat(to: NSNumber(value: integerPartNumber))
        }
        let decimalPart: String = separatedInput[1]
        let hasOnlyPoint: Bool = decimalPart.isEmpty
        let hasZeroAtTheEnd: Bool = decimalPart.hasSuffix("0")
        let formattedIntegerNumber: String = applyNumberFormat(to: NSNumber(value: integerPartNumber))
        if hasOnlyPoint {
            return "\(formattedIntegerNumber)."
        }
        else if hasZeroAtTheEnd {
            return "\(formattedIntegerNumber).\(decimalPart)"
        } else {
            return applyNumberFormat(to: NSNumber(value: inputNumber))
        }
    }
    
    private func applyNumberFormat(to input: NSNumber) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        return numberFormatter.string(for: input) ?? ""
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
