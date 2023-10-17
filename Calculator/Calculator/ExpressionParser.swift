//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Hisop on 2023/10/11.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let numberElements = componentsByOperator(from: input).compactMap{ Double($0) }
        var operands = CalculateItemQueue<Double>()
        var operators = CalculateItemQueue<Operator>()
        
        numberElements.forEach {
            operands.enqueue(value: $0)
        }
        input.forEach {
            guard let `operator` = Operator(rawValue: $0) else {
                return
            }
            operators.enqueue(value: `operator`)
        }

        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperator(from input: String) -> [String] {
        var components = input
        
        Operator.allCases.forEach {
            components = components.split(with: $0.rawValue).joined(separator: " ")
        }

        return components.split(with: " ")
    }
}
