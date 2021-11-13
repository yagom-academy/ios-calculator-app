//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Seul Mac on 2021/11/14.
//

import Foundation

enum ExpressionParser {
    
    static func componentsByOneOperator(from input: [String], with target: Character) -> [String] {
        var result: [String] = []
        for formula in input {
            result += formula.split(with: target)
        }
        return result
    }
    
}
