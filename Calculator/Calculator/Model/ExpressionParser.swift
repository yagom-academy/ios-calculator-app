//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이차민 on 2021/11/12.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operatorMarks = Operator.marks
        let operators = input.filter { operatorMarks.contains($0) }.compactMap { Operator(rawValue: $0) }
        let operands = componentsByOperators(from: input).compactMap { Double($0) }
        let operatorQueue = CalculatorItemQueue(operators)
        let operandQueue = CalculatorItemQueue(operands)
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let expression = [input]
        let operandsArray = Operator.allCases.reduce(expression) { (expressionSplitedByOperator: [String], `operator`: Operator) -> [String] in
            return expressionSplitedByOperator.flatMap { $0.split(with: `operator`.rawValue) }}
        return operandsArray
    }
}
