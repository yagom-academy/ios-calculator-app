//
//  ExpressionParser.swift
//  Calculator
//
//  Created by kaki on 2023/01/27.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let components = componentsByOperators(from: input)

        components.forEach {
            if let operand = Double($0) {
                formula.operands.enqueue(operand)
            }
        }

        input.compactMap { Operator(rawValue: $0) }.forEach { formula.operaters.enqueue($0) }

        return formula
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
