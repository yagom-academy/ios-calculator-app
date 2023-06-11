//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Yetti on 2023/06/09.
//
import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let operands = componentsByOperators(from: input)
        let operators = Array(input.filter { $0.isNumber == false })
        
        for operand in operands {
            if let operand = Double(operand) {
                formula.operands.enqueue(operand)
            }
        }
        
        for `operator` in operators {
            if let `operator` = Operator(rawValue: `operator`) {
                formula.operators.enqueue(`operator`)
            }
        }

        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.components(separatedBy: ["+", "-", "/", "*"])
    }
}
