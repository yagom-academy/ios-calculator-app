//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Seul Mac on 2021/11/14.
//

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Operator>()
        
        let operands = componentsByOperators(from: input).compactMap { Double($0) }
        let operators = input.compactMap { Operator(sign: $0) }
        operands.forEach { operandsQueue.enqueue($0) }
        operators.forEach { operatorsQueue.enqueue($0) }
        
        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result = [input]
        let emptyArray: [String] = []
        
        for target in Operator.allCases {
            result = result.reduce(emptyArray) { $0 + $1.split(with: target.rawValue) }
        }
        return result
    }
    
}
