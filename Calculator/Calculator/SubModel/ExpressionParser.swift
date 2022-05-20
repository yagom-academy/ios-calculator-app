//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Kay on 2022/05/20.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var retrievedOperators = CalculatorItemQueue<String>()
        var retrievedOperands = CalculatorItemQueue<String>()

        var operators = componentsByOperators(from: input)
        var operands = input.split { ["+", "-", "*", "/"].contains(String($0)) }

        while !(operators.isEmpty && operands.isEmpty) {
            if !operators.isEmpty {
                retrievedOperators.enqueue(operators.removeFirst())
            }
            if !operands.isEmpty {
                retrievedOperands.enqueue(String(operands.removeFirst()))
            }
        }
        return Formula(operands: retrievedOperands, operators: retrievedOperators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.filter {$0 == "+" || $0 == "-" || $0 == "/" || $0 == "*" }.map { String($0) }
    }
}
