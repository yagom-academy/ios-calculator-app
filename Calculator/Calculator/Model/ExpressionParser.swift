//
//  ExpressionParser.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/24.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula: Formula = Formula()
        
        let operands = componentsByOperators(from: input)
        operands.forEach {
            guard let number = Double($0) else { return }
            formula.operands.enqueue(item: number)
        }
        
        let operators = Operator.allCases.map { $0.rawValue }
        let operatorQueue = input
            .map { $0 }
            .filter { operators.contains($0) }
        operatorQueue.forEach {
            guard let operatorSign = Operator(rawValue: $0) else { return }
            formula.operators.enqueue(item: operatorSign)
        }

        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators: CharacterSet = CharacterSet(
            charactersIn: Operator.allCases.map {
                String($0.rawValue)
            }.joined())
        
        let numbers = input.components(separatedBy: operators)
        
        return numbers
    }
}
