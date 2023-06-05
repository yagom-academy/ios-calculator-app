//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Serena on 2023/06/05.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        return Formula(operands: CalculatorItemQueue(queue: [0.0]), operators: CalculatorItemQueue(queue: [""]))
    }
    
    static private func componentsByOperators(from Input: String) -> [String] {
        return [""]
    }
}
