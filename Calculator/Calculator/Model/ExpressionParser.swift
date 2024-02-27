//
//  ExpressionParser.swift
//  Calculator
//
//  Created by H on 2/14/24.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
        var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
        
        let parsedExpressions = componentsByOperators(from: input)
        for expression in parsedExpressions {
            if let operand = Double(expression) {
                operands.push(operand)
                break
            }
            
            if let `operator` = Operator(rawValue: Character(expression)) {
                operators.push(`operator`)
                break
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var components: [String] = []
        var tempOperand: String = ""
        
        for char in input {
            let str = String(char)
            if Operator.allCases.contains(where: { `operator` in
                return `operator`.rawValue == char
            }) {
                components.append(tempOperand)
                components.append(str)
                tempOperand = ""
            } else {
                tempOperand.append(str)
            }
        }
        
        if tempOperand != "" {
            components.append(tempOperand)
        }
        
        return components
    }
}
