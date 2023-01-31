//
//  ExpressionParser.swift
//  Calculator
//
//  Created by kaki on 2023/01/27.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        let components = componentsByOperators(from: input)

        components.forEach {
            if let operand = Double($0) {
                operands.enqueue(operand)
            }
        }

        input.compactMap { Operator(rawValue: $0) }.forEach { operators.enqueue($0) }

        return Formula(operands: operands, operaters: operators)
    }

    private static func componentsByOperators(from input: String) -> [String] {
        var components = [input]

        Operator.allCases.forEach { Operator in
            var splitedComponents: [String] = []

            components.forEach {
                splitedComponents += $0.split(with: Operator.rawValue)
            }

            components = splitedComponents
        }

        return components
    }
}
