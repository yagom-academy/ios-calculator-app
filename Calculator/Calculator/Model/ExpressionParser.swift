//
//  ExpressionParser.swift
//  Calculator
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        componentsByOperators(from: input).forEach {
            if let operand: Double = Double($0) {
                operands.enqueue(operand)
            }
        }
        
        input.filter {
            Operator.allCases.map { $0.rawValue }.contains($0)
        }.forEach {
            if let operatorByRawValue = Operator(rawValue: $0) {
                operators.enqueue(operatorByRawValue)
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let operators: String = Operator.allCases.map{ String($0.rawValue) }.joined()
        return input.components(separatedBy: CharacterSet(charactersIn: operators))
    }
}
