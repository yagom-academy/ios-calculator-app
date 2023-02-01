//
//  ExpressionParser.swift
//  Calculator
//
//  Created by kokkilE on 2023/01/27.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        
        input.compactMap { Operator(rawValue: $0) }.forEach {
            let node = Node($0)
            formula.operators.enqueueCalculateItems(node)
        }
        
        componentsByOperators(from: input).compactMap { Double($0) }.forEach {
            let node = Node($0)
            formula.operands.enqueueCalculateItems(node)
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var components = [input]
        
        for target in Operator.allCases {
            var splitedComponents = [String]()
            
            components.forEach {
                splitedComponents += $0.split(with: target.rawValue)
            }
            
            components = splitedComponents
        }
        
        return components
    }
}
