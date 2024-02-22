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
        var operators: CalculatorItemQueue<String> = CalculatorItemQueue<String>()
        
        let parsedExpressions = componentsByOperators(from: input)
        for expression in parsedExpressions {
            if let number = Double(expression) {
                operands.push(number)
            } else {
                operators.push(expression)
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var components: [String] = []
        var tempOperand: String = ""
        
        for char in input {
            let str = String(char)
            if str == "+" || str == "-" || str == "%" || str == "*" {
            if str == "+" || str == "−" || str == "÷" || str == "×" {
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
