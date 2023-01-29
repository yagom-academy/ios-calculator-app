//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Jinah Park on 2023/01/27.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandArray = componentsByOperators(from: input).compactMap { Double($0) }
        let operands: CalculatorItemQueue<Double> = .init(operandArray)
        
        let operatorArray = input.compactMap { Operator(rawValue: $0) }
        let operators: CalculatorItemQueue<Operator> = .init(operatorArray)
        
        let components = Formula(operands: operands, operators: operators)
        return components
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var componentsByOperators = [input]
        
        for operateSymbol in Operator.allCases {
            var temporaryComponents: [String] = []
            for component in componentsByOperators {
                temporaryComponents += component.split(with: operateSymbol.rawValue)
            }
            componentsByOperators = temporaryComponents
        }
        
        return componentsByOperators
    }
}
