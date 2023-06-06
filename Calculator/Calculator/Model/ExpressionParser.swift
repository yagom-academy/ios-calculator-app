//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 박종화 on 2023/06/02.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        let operandComponents = componentsByOperators(from: input)
        let operatorComponents = componentsByOperators(from: input)
        let formula = Formula(operands: operands, operators: operators)

        operandComponents
            .compactMap{ Double($0) }
            .forEach{ operands.enqueue($0) }
        
        operatorComponents
            .compactMap{ Operator(rawValue: $0) }
            .forEach{ operators.enqueue($0) }
         
        return formula
    }

    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }

