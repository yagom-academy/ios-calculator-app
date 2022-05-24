//
//  ExpressionParser.swift
//  Calculator
//
//  Created by yeton on 2022/05/20.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let inputOperands = componentsByOperators(from: input)
        let inputOperators = componentsByOperands(from: input)
        var operandQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        inputOperands.forEach {
            if let doubleValue = Double($0) {
                operandQueue.enqueue(data: doubleValue)
            }
        }
        
        inputOperators.forEach {
            if let operatorValue = Operator(rawValue: Character($0)) {
                operatorQueue.enqueue(data: operatorValue)
            }
        }
        
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operands = input.components(separatedBy: ["+","-","/","*"])
        
        return operands
    }
    
    private static func componentsByOperands(from input: String) -> [String] {
        let operators = input.filter { !$0.isNumber && $0 != "." }.map { String($0) }
        
        return operators
    }
}


