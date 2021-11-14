//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/14.
//

import Foundation

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        return Formula()
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        let operatorRawValues = Operator.allCases.map{ $0.rawValue }
        
        let trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let components = operatorRawValues.reduce([trimmedInput]) {
            (result: [String], operatorRawValue: Character) in
            return result.flatMap { $0.split(with: operatorRawValue) }
        }
        return components
    }
}
