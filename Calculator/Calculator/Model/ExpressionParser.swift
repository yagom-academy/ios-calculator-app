//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Minsup on 2023/05/31.
//

enum ExpressionParser {    
    static func parse(from input: String) -> Formula {        
        let operands = componentsByOperators(from: input)
            .compactMap { Double($0)}
        let operators = input
            .compactMap { Operator(rawValue: $0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {        
        var result: [String] = []
        var currentSegment: String = ""
        
        for char in input {
            currentSegment.append(char)
            
            if char.isOperator {
                result.append(contentsOf: currentSegment.split(with: char))
                currentSegment = ""
            }
        }
        
        if !currentSegment.isEmpty {
            result.append(currentSegment)
        }
        
        return result
    }
}
