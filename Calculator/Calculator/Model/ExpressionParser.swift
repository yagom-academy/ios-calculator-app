//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/10.
//

import Foundation

enum ExpressionParser {
    static func parase(from input: String) -> Formula {
        return Formula()
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map({ String($0.rawValue) }).reduce("", { $0 + $1 })
        let result = input.components(separatedBy: operators)
        
        return result
    }
}
