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
        let inputArr = input.split(with: " ")
        var operatorQueue: [Character] = []
        
        for ele in inputArr {
            if ele.count > 1 { continue }
            if operators.contains(Character(ele)) {
                operatorQueue.append(Character(ele))
            }
        }
        
        operatorQueue.forEach {
            guard let operatorSign = Operator(rawValue: $0) else { return }
            formula.operators.enqueue(item: operatorSign)
        }

        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { String($0.rawValue) }
        let numbers = input
            .split(with: " ")
            .filter { !operators.contains($0) }
        
        return numbers
    }
}
