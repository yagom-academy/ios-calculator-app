//
//  ExpressionParser.swift
//  Calculator
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        fatalError()
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let stringOperators = Operator.allCases.map{ String($0.rawValue) }.joined()
        return input.components(separatedBy: CharacterSet(charactersIn: stringOperators))
    }
}
