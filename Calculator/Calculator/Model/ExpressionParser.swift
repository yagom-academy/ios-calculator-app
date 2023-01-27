//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Rowan on 2023/01/27.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = self.componentsByOperators(from: input)
        let characterArray = input.split(with: " ")
        var currentFormula = Formula()
        
        for member in operands {
            guard let operand = Double(member) else { break }
            currentFormula.operands.enqueue(operand)
        }
        
        for member in characterArray {
            let convertedMember = Character(member)
            
            if convertedMember.isNumber == false,
               let `operator` = Operator(rawValue: convertedMember) {
                currentFormula.operators.enqueue(`operator`)
            }
        }
        
        return currentFormula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let inputWithoutOperators = input.components(separatedBy: ["+", "-", "/", "*"]).joined(separator: " ")
        let result = inputWithoutOperators.split(with: " ")
        
        return result
    }
}
