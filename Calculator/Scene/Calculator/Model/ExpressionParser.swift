//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이은찬 on 2022/05/20.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let componentedInput = componentByOperators(from: input)
        let formula = Formula()
        componentedInput.forEach { node in
            if let operand = Double(node) {
                formula.operands.enqueue(operand)
            } else {
                guard let `operator` = Operator(rawValue: Character(node)) else { return }
                formula.operators.enqueue(`operator`)
            }
        }
        return formula
    }
    
    static func componentByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
