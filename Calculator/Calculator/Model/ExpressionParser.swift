//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/14.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = componentsByOperators(from: input).compactMap { Double($0) }
        let operandQueue = CalculatorItemQueue(elements: operands)
        
        let operatorCharacters = Operator.allCases
            .compactMap { $0.rawValue }
        let operators = input
            .filter { operatorCharacters.contains($0) }
            .compactMap{ Operator(rawValue: $0)}
        let operatorQueue = CalculatorItemQueue(elements: operators)
        
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let initialArray = [input]
        let operatorCharacters = Operator.allCases
            .compactMap { $0.rawValue }
        let operandStringArray = operatorCharacters
            .reduce(initialArray) { (array: [String], operatorCharacter: Character) -> [String] in
                array.flatMap { $0.split(with: operatorCharacter) }
            }
        return operandStringArray
    }
}

