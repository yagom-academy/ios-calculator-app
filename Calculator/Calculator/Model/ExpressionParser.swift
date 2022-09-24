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
        
        input.split(with: " ").filter { Double($0) == nil }.forEach {
            guard let operatorSymbol = Operator(rawValue: Character($0)) else { return }
            formula.operators.enqueue(operatorSymbol)
        }
        
        return formula
    }
    
    static private func componentsByOperator(from input: String) -> [String] {
        return input.split(with: " ").compactMap {
            if Double($0) != nil {
                return $0
            } else {
                return nil
            }
        }
    }
}
