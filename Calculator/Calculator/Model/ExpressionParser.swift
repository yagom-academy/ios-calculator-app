//
//  ExpressionParser.swift
//  Calculator
//
//  Created by marisol on 2022/03/18.
//

import Foundation

enum ExpressionParser {
    public static func parse(from input: String) -> Formula {
        var formula: Formula = Formula()
        let whiteSpaceDeletedString = componentsByOperators(from: input)
        var stringOperands: [String] = []
        var stringOperators: [String] = []
        
        for index in 0..<whiteSpaceDeletedString.count {
            (index % 2) == 0 ? stringOperands.append(whiteSpaceDeletedString[index]) : stringOperators.append(whiteSpaceDeletedString[index])
        }
        
        let operands = stringOperands.compactMap { Double($0) }
        for operand in operands {
            formula.operands.enqueue(operand)
        }
        
        let characterOperators = stringOperators.map { Character($0) }
        let operators = characterOperators.compactMap { Operator(rawValue: $0) }
        for someOperator in operators {
            formula.operators.enqueue(someOperator)
        }
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
