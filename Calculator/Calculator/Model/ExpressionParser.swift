//
//  ExpressionParser.swift
//  Calculator
//
//  Created by jin on 9/21/22.
//

import Darwin

enum ExpressionParser {
    
    static func componentsByOperators(from input: String) -> [String] {
        
        var result: [String] = []
        var operand = ""
        
        for char in input {
            if Operator(rawValue: char) != nil {
                result.append(operand)
                result.append(String(char))
                operand = ""
            } else {
                operand += String(char)
            }
        }
        result.append(operand)
        
        return result
    }
}
