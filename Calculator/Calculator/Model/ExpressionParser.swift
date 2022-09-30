//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 정선아 on 2022/09/23.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let divided = ExpressionParser.componentsByOperators(from: input)
        let operands = divided.compactMap { Double($0) }
        let operators = input.compactMap { Operator(rawValue: $0) }
         
        var operandsToQueue = CalculatorItemQueue<Double>()
        operands.forEach { operandsToQueue.enQueue(element: $0)}
        
        var operatorsToQueue = CalculatorItemQueue<Operator>()
        operators.forEach{ operatorsToQueue.enQueue(element: $0)}
        
        return Formula(operands: operandsToQueue, operators: operatorsToQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let noCommaString = input.components(separatedBy: ",").joined()
        return noCommaString.split(with: " ")
    }
}
