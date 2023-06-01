//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/31.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let allOperators = Operator.allCases.map { $0.rawValue }
        var operatorsQueue = CalculatorItemQueue()
        var operandsQueue = CalculatorItemQueue()
        let _ = input.filter { allOperators.contains($0) }.map { operatorsQueue.enqueue(String($0)) }
        let _ = self.componentsByOperators(from: input).map { operandsQueue.enqueue($0) }
        return Formula(operands:operandsQueue, operators: operatorsQueue)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let allOperators = Operator.allCases.map { $0.rawValue }
        let result = allOperators.map { input.split(with: $0).joined() }
        return result
    }
}
