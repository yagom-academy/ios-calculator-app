//
//  ExpressionParser.swift
//  Calculator
//
//  Created by yeton on 2022/05/20.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let inputValues = componentsByOperators(from: input)
        var operandQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        inputValues.forEach {
            if let operand = Double($0) {
                operandQueue.enqueue(data: operand)
                return
            }
            
            if let `operator` = Operator(rawValue: Character($0)) {
                operatorQueue.enqueue(data: `operator`)
            }
        }
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}


