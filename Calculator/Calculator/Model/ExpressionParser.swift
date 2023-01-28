//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Rowan on 2023/01/27.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let components = self.componentsByOperators(from: input)
        var formula = Formula()
        
        components
            .compactMap { Double($0) }
            .forEach { formula.operands.enqueue($0) }
        
        components
            .filter { $0.count == 1 }
            .compactMap { Operator(rawValue: Character($0)) }
            .forEach { formula.operators.enqueue($0) }

        return formula
    }

    static private func componentsByOperators(from input: String) -> [String] {
        let result = input.split(with: " ")
        
        return result
    }
}

