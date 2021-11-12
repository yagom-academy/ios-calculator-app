//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 황제하 on 2021/11/12.
//

import Foundation

enum ExpressionParser {
    static func parse(form input: String) -> Formula {
        return Formula()
    }
    
    static func componentsByOperators(form input: String) -> [String] {
        var result = input
        
        Operator.allCases.forEach { `operator` in
            result = result.replacingOccurrences(of: `operator`.rawValue.description, with: " ")
        }
        
        return result.split(with: " ")
    }
}
