//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Baem on 2022/09/24.
//
    
enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        return Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())
    }
    
    private static func componentsByOperator(from input: String) -> [String] {
        return [input]
    }
}
