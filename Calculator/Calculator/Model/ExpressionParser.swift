//
//  ExpressionParser.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/24.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        var validInput = input
        
        guard let firstElement = input.first else {
            return formula
        }
        
        if !firstElement.isNumber {
            validInput = "0" + validInput
        }
        
        let operands = componentsByOperators(from: validInput)
        operands.forEach {
            guard let number = Double($0) else { return }
            formula.operands.enqueue(item: number)
        }

        let operators = Operator.allCases.map { $0.rawValue }
        let splitInput = validInput.split(with: " ")
        var lastElement: String = " "
        var operatorQueue: [Character] = []
        
        // !operators.contains(Character(splitInput[i])),
        for i in 0..<splitInput.count {
            if Double(splitInput[i]) != nil,
               operators.contains(Character(lastElement)) {
                operatorQueue.append(Character(lastElement))
            }
            
            lastElement = splitInput[i]
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
