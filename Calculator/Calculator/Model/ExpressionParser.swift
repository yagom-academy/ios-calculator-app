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
        extractOperators(from: input)
            .forEach(queueOperators.enqueue(_:))
        return Formula(operands: queueOperands, operators: queueOperators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var newInput = input
        var operands = [String]()
        extractOperators(from: input).forEach {
            var splitedValues = newInput.split(with: $0.rawValue)
            guard let remainingValue = splitedValues.popLast(),
                  let operandValue = splitedValues.popLast() else { return }
            newInput = remainingValue
            operands.append(operandValue)
        }
        return operands
    }
    
    static private func extractOperators(from input: String) -> [Operator] {
        return input.compactMap {Operator(rawValue: $0)}
    }
}
