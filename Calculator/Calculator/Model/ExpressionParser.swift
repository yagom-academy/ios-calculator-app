//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이예은 on 2022/05/20.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let separatedInputValue = componentsByOperators(from: input)
        var operandQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        separatedInputValue.forEach {
            if let doubleTypeValue = Double($0) {
                operandQueue.enqueue(data: doubleTypeValue)
                return
            }
            
            if let operaterTypeValue = Operator(rawValue: Character($0)) {
                operatorQueue.enqueue(data: operaterTypeValue)
            }
        }
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}

