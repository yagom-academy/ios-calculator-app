//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Charles on 2023/10/08.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operatorsQueue = CalculatorItemQueue<Operator>()
        var operandsQueue = CalculatorItemQueue<Double>()
        let operandsArray = componentsByOperators(from: input)
        
        operandsArray.compactMap { Double($0) }.forEach { component in
            operandsQueue.enqueue(component)
        }
        
        input.compactMap { Operator(rawValue: $0) }.forEach { component in
            operatorsQueue.enqueue(component)
        }
        
        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var result = [input]
        
        Operator.allCases.forEach { `operator` in
            result = result.flatMap { component in
                component.split(with: `operator`.rawValue)
            }
        }
        
        return result.filter { $0 != "" }
    }
}


