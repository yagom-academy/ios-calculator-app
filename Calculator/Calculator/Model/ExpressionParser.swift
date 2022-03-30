//
//  ExpressionParser.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/28.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let splitSentence = componentsByOperators(from: input)
        let operandQueue = CalculatorQueue<Double>()
        let operatorQueue = CalculatorQueue<Operator>()
        
        for element in splitSentence {
            if let operandElement = Double(element) {
                operandQueue.enqueue(operandElement)
                continue
            }
            if let operatorElement = Operator(rawValue: Character(element)) {
                operatorQueue.enqueue(operatorElement)
            }
        }
        return Formula(operandQueue: operandQueue, opratorQueue: operatorQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
