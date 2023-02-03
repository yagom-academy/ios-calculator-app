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
        
        components.forEach {
            if let operand = Double($0) {
                formula.operands.enqueue(operand)
            } else if $0.count == 1,
                      let `operator` = Operator(rawValue: Character($0)) {
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
