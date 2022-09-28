//
//  ExpressionParser.swift
//  Calculator
//
//  Created by leewonseok on 2022/09/20.
//

enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        var formula = Formula()
    
        componentsByOperator(from: input).compactMap{ Double($0) }.forEach {
            formula.operands.enqueue($0)
        }
        
        input.split(with: " ").filter { !$0.isDouble }.forEach {
            guard let `operator` = Operator(rawValue: Character($0)) else { return }
            formula.operators.enqueue(`operator`)
        }
        
        return formula
    }
    
    static private func componentsByOperator(from input: String) -> [String] {
        return input.split(with: " ").compactMap { $0.isDouble ? $0 : nil }
    }
}
