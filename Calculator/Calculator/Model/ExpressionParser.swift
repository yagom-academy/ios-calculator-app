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
            .compactMap { value in
                Double(value)
            }
            .forEach { value in
                operandQueue.enqueue(value)
            }
        
        componentsByOperators(from: input)
            .filter { value in
                value.count == 1
            }
            .compactMap({ value in
                Operator(rawValue: Character(value))
            })
            .forEach { value in
                operatorQueue.enqueue(value)
            }
    
        return Formula(operandQueue: operandQueue, operatorQueue: operatorQueue)
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
