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
        let stringOperators = input.filter { operatorMarks.contains($0) }
        let stringOperands = componentsByOperators(from: input)
        let operators = CalculatorItemQueue(stringOperators.compactMap { Operator(rawValue: $0) })
        let operands = CalculatorItemQueue(stringOperands.compactMap { Double($0) })
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let expression = [input]
        let operandsArray = Operator.allCases.reduce(expression) { (expressionSplitedByOperator: [String], `operator`: Operator) -> [String] in
            return expressionSplitedByOperator.flatMap { $0.split(with: `operator`.rawValue) }}
        return operandsArray
    }
}
