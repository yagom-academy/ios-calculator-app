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
        
        for member in components {
            if let operand = Double(member) {
                formula.operands.enqueue(operand)
            } else if let `operator` = Operator(rawValue: Character(member)) {
                formula.operators.enqueue(`operator`)
            }
        }

        return formula
    }

    static private func componentsByOperators(from input: String) -> [String] {
        let result = input.split(with: " ")
        
        return result
    }
}
