//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 송종환 on 2023/01/26.
//

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        
        var operatorQueue = CalculatorItemQueue<Operator>()
        var operandQueue = CalculatorItemQueue<Double>()
                
        extractOperators(from: input)
                .map {Character($0)}
                .compactMap { Operator(rawValue: $0) }
                .forEach {operatorQueue.enqueueItem($0) }
               
        componentsByOperators(from: input)
                .compactMap { Double($0) }
                .forEach{ operandQueue.enqueueItem($0) }
        
        return Formula(operators: operatorQueue, operands: operandQueue)
    }
    
    static private func componentsByOperators(from target: String) -> [String] {
        
        var resultNumber: [String] = []
        resultNumber.append(target)

        for operators in Operator.allCases {
            var curruentNumber: [String] = []

            resultNumber.forEach {
                curruentNumber += $0.split(someOperator: operators.rawValue)
            }
            
            resultNumber = curruentNumber
        }
        return resultNumber
    }
    
    static private func extractOperators(from target: String) -> [String] {
        
        return target
            .split(whereSeparator: {$0.isNumber || $0 == "."})
            .map{String($0)}
        
    }
    
}


