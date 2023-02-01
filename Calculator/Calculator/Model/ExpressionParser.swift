//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 무리 on 2023/01/30.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let components = componentsByOperators(from: input)
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Operator>()
        
        for component in components {
            if let component = Double(component) {
                operandsQueue.enqueue(component)
            } else if let component = Operator(rawValue: Character(component)) {
                operatorsQueue.enqueue(component)
            }
        }

        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let splitedInput = input.split(with: " ")
        
        return splitedInput
    }
}
