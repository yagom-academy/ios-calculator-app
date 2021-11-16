//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Sunwoo on 2021/11/16.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var calculateFormula: Formula = Formula()
        componentsByOperators(from: input).forEach {
            guard let operation = Double($0) else {
                return
            }
        
            calculateFormula.operands.enqueue(operation: operation)
        }
        
        let operators: [Character] = input.filter { "+/*₋".contains($0) }
        
        operators.forEach { `operator` in
            guard let arithmetic = Operator(rawValue: `operator`) else {
                return
            }
            
            calculateFormula.operators.enqueue(operation: arithmetic)
        }
        
        return calculateFormula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var resultOfReplacing = input.replacingOccurrences(of: String(Operator.add.rawValue), with: " ")
        resultOfReplacing = resultOfReplacing.replacingOccurrences(of: String(Operator.subtract.rawValue), with: " ")
        resultOfReplacing = resultOfReplacing.replacingOccurrences(of: String(Operator.divide.rawValue), with: " ")
        resultOfReplacing = resultOfReplacing.replacingOccurrences(of: String(Operator.multiply.rawValue), with: " ")
        
        return resultOfReplacing.split(with: " ")
    }
}
