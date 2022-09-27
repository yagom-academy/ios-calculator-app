//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 서현웅 on 2022/09/22.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula: Formula = Formula()
        
        let operands = componentsByOperators(from: input)
        let doubleOperands = operands.compactMap { str in Double(str)}
        
        doubleOperands.forEach { value in
            formula.operands.enqueue(value)
        }

        
        let operators = input.compactMap { str in Operator(rawValue: str) }
        
        operators.forEach { value in
            formula.operators.enqueue(value)
        }
        return formula
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        let separatedToArray = input.components(separatedBy: ["+", "-", "*", "/"])
        let trimmingSpaceArray = separatedToArray.filter({$0 != ""})
        return trimmingSpaceArray
    }
}
