//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 고은 on 2021/11/22.
//

import Foundation

enum ExpressionParser {
    enum ExpressionParser {
        static func parse(from input: String) -> Formula {
            let operands = componentsByOperators(from: input).compactMap { Double($0) }
            let operators = input.compactMap { Operator(rawValue: $0) }
            return Formula(
                operands: CalculatorItemQueue(operands),
                operators: CalculatorItemQueue(operators)
            )
        }
        
        private static func componentsByOperators(from input: String) -> [String] {
            var result: [String] = [input]
            Operator.allCases.forEach { targetOperator in
                var splitedString: [String] = []
                for input in result {
                    splitedString += input.split(with: targetOperator.rawValue)
                    result = splitedString
                }
            }
            return result
        }
    }
}
