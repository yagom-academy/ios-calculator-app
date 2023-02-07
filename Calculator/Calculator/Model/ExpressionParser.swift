//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Christy, Muri on 2023/01/30.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let components = componentsByOperators(from: input)
        var operandQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        let operators = input.compactMap{ Operator(rawValue: $0) }
        
        for `operator` in operators {
            operatorQueue.enqueue(`operator`)
        }
        
        for component in components {
            if let componentAsDouble = Double(component) {
                operandQueue.enqueue(componentAsDouble)
            }
        }
        
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let inputComponents = [input].flatMap { inputComponent in
            Operator.allCases.reduce(into: [inputComponent]) { result, operateSymbol in
                result = result.flatMap { $0.split(with: operateSymbol.rawValue) }
            }
        }
        
        return inputComponents
    }
}
