//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 1 on 2021/11/15.
//

import Foundation

enum ExpressionParser {

    static func parse(from input: String) -> Formula {
        let operatorMarks = Operator.marks
        let stringOperators = input.filter { operatorMarks.contains($0) }
        let stringOperands = componentsByOperator(from: input)
        let operators = CalculatorItemQueue(stringOperators.compactMap({Operator(rawValue: $0)}))
        let operands = CalculatorItemQueue(stringOperands.compactMap({Double($0)}))
        return Formula(operands: operands, operators: operators)
    }

    static private func componentsByOperator(from input: String) -> [String] {
        let expression = [input]
        let operandsArray = Operator.allCases.reduce(expression){(expressionSplitedByOperator: [String], `operator`: Operator) -> [String] in
            return expressionSplitedByOperator.flatMap{$0.split(with: `operator`.rawValue)}
        }
        return operandsArray
    }
}
