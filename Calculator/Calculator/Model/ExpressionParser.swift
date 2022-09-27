//
//  ExpressionParser.swift
//  Calculator
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<String>()
        
        componentsByOperators(from: input).forEach {
            if let doubleOperand = Double($0) {
                operands.enqueue(doubleOperand)
            }
        }
        
        input.forEach { character in
            if Operator.allCases.map({ $0.rawValue }).contains(character) {
                operators.enqueue(String(character))
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let stringOperators = Operator.allCases.map{ String($0.rawValue) }.joined()
        return input.components(separatedBy: CharacterSet(charactersIn: stringOperators))
    }
}
