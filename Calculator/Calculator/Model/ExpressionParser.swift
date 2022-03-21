//  ExpressionParser.swift
//  Calculator
//  Created by LIMGAUI on 2022/03/20

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let queueOperands = CalculateItemQueue<Double>()
        let queueOperators = CalculateItemQueue<Operator>()
        componentsByOperators(from: input)
            .compactMap(Double.init)
            .forEach(queueOperands.enqueue(_:))
        input.compactMap {Operator(rawValue: $0)}
            .forEach(queueOperators.enqueue(_:))
        return Formula(operands: queueOperands, operators: queueOperators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
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
            if let _ = Int(newInput) { operands.append(newInput); return }
        }
        return operands
    }
}
