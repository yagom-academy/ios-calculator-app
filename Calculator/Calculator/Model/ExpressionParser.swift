//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/10.
//

import Foundation

enum ExpressionParser {
    static let operatorSet = Operator.allCases.map { String($0.rawValue) }
    
    static func parse(from input: String) -> Formula {
        let operationComponents: [String] = ExpressionParser.componentsByOperators(from: input)
        let operands = operationComponents.compactMap { convertToDouble(from: $0) }
        let operators = operationComponents.filter { operatorSet.contains($0) }
            .reduce("", { $0 + $1 } )
            .compactMap { Operator(rawValue: $0) }
        
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Operator>()

        operands.forEach { operandsQueue.enqueue($0) }
        operators.forEach { operatorsQueue.enqueue($0) }

        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let result = input.split(with: " ")
        
        return result
    }
    
    private static func convertToDouble(from string: String) -> Double? {
        guard let result = Double(string) else {
            return nil
        }
        return result
    }
}
