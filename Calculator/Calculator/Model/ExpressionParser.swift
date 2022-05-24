//
//  ExpressionParser.swift
//  Calculator
//
//  Created by dhoney96 on 2022/05/20.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        
        input.split(with: " ").filter {
            Double($0) == nil
        }.forEach {
            guard let sign = Operator(rawValue: Character($0)) else { return }
            formula.operators.enqueue(sign)
        }
        
        componentsByOperators(from: input).compactMap {
            Double($0)
        }.forEach {
            formula.operands.enqueue($0)
        }
        
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let abc = input.split(with: " ").filter {
            Double($0) != nil
        }
        return abc
    }
}
