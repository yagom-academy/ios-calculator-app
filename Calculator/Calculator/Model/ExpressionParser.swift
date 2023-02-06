//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 천승현 on 2023/01/27.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operandQueue: CalculatorItemQueue<Double>
        var operatorQueue: CalculatorItemQueue<Operator>
        
        operatorQueue = CalculatorItemQueue(
            enqueueStack: input.compactMap { Operator(rawValue: $0) }
        )
        operandQueue = CalculatorItemQueue(
            enqueueStack: componentnsByOperators(from: input).compactMap { Double($0) }
        )
        
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    static private func componentnsByOperators(from input: String) -> [String] {
        var results: [String] = [input]
        
        Operator.allCases.forEach { `operator` in
            results = results.map {
                $0.split(with: `operator`.rawValue)
            }.flatMap { $0 }
        }
        
        return results
    }
}


