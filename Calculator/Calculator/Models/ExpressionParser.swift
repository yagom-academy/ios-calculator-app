//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Charles on 2023/10/08.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let componentsArray = componentsByOperators(from: input)
        
        componentsArray.forEach { component in
            if let operand = Double(component) {
                formula.operands.enqueue(operand)
            } else if let operatorSymbol = Operator(rawValue: Character(component)) {
                formula.operators.enqueue(operatorSymbol)
            }
        }
        
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var result = ""
        
        for char in input {
            if char != " " {
                result += String(char) + " "
            }
        }
        
        return result.split(with: " ").filter { $0 != "" }
    }
}


