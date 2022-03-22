//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/18.
//

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        
        let componentsString = componentsByOperators(from: input)
        var operands = LinkedQueue<Double>()
        var operators = LinkedQueue<Operator>()
        
        for value in componentsString {
            
            if let number = Double(value) {
                operands.append(newNode: number)
                continue
            }
            
            if let convertOper = Operator(rawValue: Character(value)) {
                operators.append(newNode: convertOper)
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}

