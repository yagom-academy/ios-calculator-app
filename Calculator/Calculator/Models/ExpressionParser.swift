//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Charles on 2023/10/08.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula? {
        return nil
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var result = ""
        
        for char in input {
            if char != " " {
                result += String(char) + " "
            }
        }
        
        return result.split(with: " ").filter{ $0 != "" }
    }
}


