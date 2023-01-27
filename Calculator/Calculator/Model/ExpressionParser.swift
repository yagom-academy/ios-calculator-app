//  ExpressionParser.swift
//  Created by 레옹아범 on 2023/01/26.

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        return Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return ["9"]
    }
}
