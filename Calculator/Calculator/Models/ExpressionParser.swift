//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Toy on 10/9/23.
//


enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let components = componentsByOperators(from: input)
        
        components.compactMap { Double($0) }
            .forEach{ formula.operands.enqueue($0) }
        
        components.filter{ Double($0) == nil }
            .compactMap{ Operator(rawValue: Character($0)) }
            .forEach { formula.operators.enqueue($0) }

        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
