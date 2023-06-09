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
            if let number = Double(operand) {
                formula.operands.enqueue(number)
            }
        }
        
        for `operator` in operators {
            if let oper = Operator(rawValue: `operator`) {
                formula.operators.enqueue(oper)
            }
        }

        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.components(separatedBy: ["+", "-", "/", "*"])
    }
}
