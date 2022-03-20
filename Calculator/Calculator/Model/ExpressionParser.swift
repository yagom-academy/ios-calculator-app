//  ExpressionParser.swift
//  Calculator
//  Created by LIMGAUI on 2022/03/20

import Foundation

enum ExpressionParser {
    static func componentsByOperators(from input: String) -> [String] {
        var newInput = input
        var operators = [Operator]()
        var operands = [String]()
        input.forEach {
            if let value = Operator(rawValue: $0) {operators.append(value)}
        }
        operators.forEach {
            let splitedValues = newInput.split(with: $0.rawValue)
            operands.append(splitedValues[0])
            newInput = splitedValues[1]
        }
        return operands
    }
}
