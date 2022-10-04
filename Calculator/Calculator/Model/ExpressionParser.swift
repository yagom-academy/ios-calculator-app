//
//  ExpressionParser.swift
//  Calculator
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        componentsByOperators(from: input).enumerated().filter { (index, element) in
            index % 2 == 0
        }.forEach {
            guard let operandValue = Double($1) else { return }
            operands.enqueue(operandValue)
        }
        
        componentsByOperators(from: input).enumerated().filter { (index, element) in
            index % 2 != 0
        }.forEach {
            guard let operatorValue = Operator(rawValue: Character($1)) else { return }
            operators.enqueue(operatorValue)
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
