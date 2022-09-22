//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김인호 on 2022/09/22.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators = CharacterSet(charactersIn: Operator.allCases.map {
            String($0.rawValue)
        }.joined())
        let result = input.components(separatedBy: operators)
        
        return result
    }
}
