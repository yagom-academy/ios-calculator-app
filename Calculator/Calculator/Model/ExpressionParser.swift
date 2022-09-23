//
//  ExpressionParser.swift
//  Created by Wonbi
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        return Formula()
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        var operators = CharacterSet()
        Operator.allCases.forEach { component in
            operators.insert(charactersIn: String(component.identifier))
        }
        
        return input.components(separatedBy: operators)
    }
}
