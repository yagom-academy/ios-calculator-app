//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Jusbug, Yetti on 2023/06/02.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandComponents = collectOperands(from: input)
        let operatorComponents = collectOperators(From: input)

        return Formula(operands: operandComponents, operators: operatorComponents)
    }

    static private func collectOperands(from input: String) -> CalculatorItemQueue<Double> {
        let operandComponents = input.split(with: " ")
        var operands = CalculatorItemQueue<Double>()

        operandComponents
            .compactMap { Double($0) }
            .forEach { operands.enqueue($0) }

        return operands
    }

    static private func collectOperators(From input: String) -> CalculatorItemQueue<Operator> {
        let operatorComponents = input.split(with: " ")
        var operators = CalculatorItemQueue<Operator>()

        operatorComponents
            .filter { $0.count == 1 }
            .compactMap { Operator(rawValue: Character($0)) }
            .forEach { operators.enqueue($0) }

        return operators
    }
}
