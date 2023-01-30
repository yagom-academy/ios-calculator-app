//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김성준 on 2023/01/27.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let components = componentsByOperators(from: input)

        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()

        for component in components {
            if let operand = Double(component) {
                operands.enqueue(operand)
            } else if let operatorSign = Operator(rawValue: Character(component)) {
                operators.enqueue(operatorSign)
            }
        }
        let formula = Formula(operands: operands, operators: operators)
        return formula
    }

    static private func componentsByOperators(from input: String) -> [String] {
        let components = input.split(with: " ")
        return components
    }
}
