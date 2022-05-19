//
//  ExpressionParser.swift
//  Calculator
//
//  Created by NAMU on 2022/05/19.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        var removeOperator = input
        
        componentsByOperators(from: removeOperator).forEach {
            removeOperator = removeOperator.replacingOccurrences(of: $0, with: " ")
            let operatorCharacter = Character($0)
            formula.operators.enqueue(data: operatorCharacter)
        }
        
        removeOperator.split(with: " ").forEach {
            guard let operand = Double($0) else {
                return
            }
            formula.operands.enqueue(data: operand)
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let result = input.filter{ !$0.isNumber }.map{ String($0) }
        return result
    }
}
