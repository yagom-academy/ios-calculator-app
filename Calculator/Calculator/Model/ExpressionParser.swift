//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Eunsoo KIM on 2021/11/12.
//

import Foundation

enum ExpressionParser {
    static let separator: Character = " "
    
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        
        let separatedInput = componentsByOperators(from: input)
        
        separatedInput
            .compactMap { Double($0) }
            .forEach { formula.operands.enqueue($0) }
        
        separatedInput
            .filter {
                Operator.allCases
                    .map { String($0.rawValue) }.contains($0)
            }
            .compactMap { Operator(rawValue: Character($0)) }
            .forEach { formula.operators.enqueue($0) }
        
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        input.split(with: separator)
    }
}
