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
            .compactMap { element in
                Double(element)
            }
            .forEach { operandElement in
                operandQueue.enqueue(operandElement)
            }
        
        componentsByOperators(from: input)
            .filter { stringDigit in
                stringDigit.count == 1
            }
            .compactMap({ element in
                Operator(rawValue: Character(element))
            })
            .forEach { operatorElement in
                operatorQueue.enqueue(operatorElement)
            }
    
        return Formula(operandQueue: operandQueue, operatorQueue: operatorQueue)
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
