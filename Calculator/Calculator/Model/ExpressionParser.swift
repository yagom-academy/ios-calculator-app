//
//  ExpressionParser.swift
//  Calculator
//
//  Created by leewonseok on 2022/09/20.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        
        componentsByOperator(from: input).compactMap{ Double($0) }.forEach {
            formula.operands.enqueue($0)
        }
        input.compactMap { Double(String($0)) == nil ? $0 : nil }.forEach { formula.operators.enqueue(Operator(rawValue: $0)!)}

        return formula
    }
    
    static private func componentsByOperator(from input: String) -> [String] {
        return input.compactMap { Double(String($0)) != nil ? String($0) : " " }
    }
}
