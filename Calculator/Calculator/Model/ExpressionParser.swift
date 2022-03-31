//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Eddy on 2022/03/20.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandQueue = CalculatorItemQueue<Double>()
        let operatorQueue = CalculatorItemQueue<Operator>()
        
        componentsByOperators(from: input)
            .compactMap { Double($0) }
            .forEach { operandQueue.enqueue($0) }
        
        componentsByOperators(from: input)
            .filter { $0.count == 1 }
            .compactMap { Operator(rawValue: Character($0)) }
            .forEach { operatorQueue.enqueue($0) }
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
