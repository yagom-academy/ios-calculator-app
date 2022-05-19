//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/20.
//
enum ExpressionParser {
    func parse(from input: String) -> Formula {
        let formula = Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())
        return formula
    }
    private func componentsByOperators(from input: String) -> [String] {
        return [String()]
    }
}
