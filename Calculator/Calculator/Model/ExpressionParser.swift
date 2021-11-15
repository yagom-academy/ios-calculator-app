//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/14.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operatorRawValues = Operator.allCases.compactMap { $0.rawValue }
        let operators = input.filter { operatorRawValues.contains($0) }
            .compactMap{ Operator(rawValue: $0)}
        let operatorQueue = CalculatorItemQueue(elements: operators)
        let operands = componentsByOperators(from: input).compactMap { Double($0) }
        let operandQueue = CalculatorItemQueue(elements: operands)
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let separators = CharacterSet(charactersIn: "+-*/")
        let separatedInputArray = input.components(separatedBy: separators)
            .map { String($0) }
        let operatorRawValues = Operator.allCases.compactMap { $0.rawValue }
        let operandStringArray = operatorRawValues.reduce(separatedInputArray) { (array: [String], operatorCharacter: Character) in
            array.flatMap { $0.split(with: operatorCharacter) }
        }
        return operandStringArray
    }
}

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target)
            .compactMap { String($0) }
    }
}
