//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/12.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        
        return Formula(operands: .init(), operators: .init())
    }
    static private func componentsByOperators(from input: String) -> [String] {
        
        return [String]()
    }
}
