//
//  ExpressionParser.swift
//  Calculator
//
//  Created by NAMU on 2022/05/19.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        
        componentsByOperators(from: input).compactMap { Double($0) }.forEach {
            formula.operands.enqueue(data: $0)
        }
        
        componentsByOperators(from: input).filter { Double($0) == nil }.compactMap { Operator.init(rawValue: Character($0)) }.forEach {
            formula.operators.enqueue(data: $0)
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
