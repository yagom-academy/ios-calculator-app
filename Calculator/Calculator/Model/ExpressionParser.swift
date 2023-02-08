//  Calculator - ExpressionParser.swift
//  created by vetto on 2023/01/27

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandsList = componentsByOperators(from: input).compactMap { Double($0) }
        let operatorsList = input.compactMap { Operator(rawValue: $0) }

        let operandQueue = CalculatorItemQueue(with: operandsList)
        let operatorQueue = CalculatorItemQueue(with: operatorsList)
        
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        
        Operator.allCases.forEach { `operator` in
            result = result.flatMap { $0.split(with: `operator`.rawValue) }
        }
        
        return result
    }
}
