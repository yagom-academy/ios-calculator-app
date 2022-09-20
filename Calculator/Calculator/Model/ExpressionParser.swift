//
//  ExpressionParser.swift
//  Calculator
//
//  Created by leewonseok on 2022/09/20.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        return Formula(operands: 10.0, operators: Operator.add)
    }
    
    static private func componentsByOperator(from input: String) -> [String] {
        return [""]
    }
}
