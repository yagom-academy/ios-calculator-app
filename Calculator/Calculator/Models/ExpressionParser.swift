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
        
        components.forEach { component in
            if let operand = Double(component) {
                formula.operands.enqueue(operand)
            } else if let `operator` = Operator(rawValue: Character(component)) {
                formula.operators.enqueue(`operator`)
            }
        }
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ").filter { $0 != "" }
    }
}
