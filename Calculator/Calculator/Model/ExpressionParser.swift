//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 1 on 2021/11/15.
//

import Foundation

enum ExpressionParser {

    static func parse(from input: String) -> Formula {
        let calculatorItems = ["➕","➖", "➗", "✖️"]
        let stringOperators = input.filter { calculatorItems.contains(String($0))}
        let stringOperands = componentsByOperator(from: input)
        let operators = CalculatorItemQueue(stringOperators.compactMap({Operator(rawValue: $0)}))
        let operands = CalculatorItemQueue(stringOperands.compactMap({Double($0)}))
        return Formula(operands: operands, operators: operators)
    }

    static private func componentsByOperator(from input: String) -> [String] {
        let initialArray = [input]
        let components = Operator.allCases.reduce(initialArray){(array: [String], operators: Operator) -> [String] in
            return array.flatMap{$0.split(with: operators.rawValue)}
        }
        return components
    }
}
