//
//  ExpressionParser.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/17.
//

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        let operandQueue = CalculatorItemQueue<Double>()
        let operatorQueue = CalculatorItemQueue<Operator>()
        
        componentsByOperators(from: input)
            .compactMap { Double($0) }
            .forEach { operandQueue.enqueue($0) }
        componentsByOperators(from: input)
            .compactMap { Operator(rawValue: Character($0)) }
            .forEach{ operatorQueue.enqueue($0)}
        
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
