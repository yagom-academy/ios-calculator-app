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
        let operatorCharacters = Operator.allCases.map{ $0.rawValue }
        
        let components = operatorCharacters.reduce([input]) {
            (result: [String], operatorCharacter: Character) in
            return result.flatMap { $0.split(with: operatorCharacter) }
        }
        return components
    }
}
