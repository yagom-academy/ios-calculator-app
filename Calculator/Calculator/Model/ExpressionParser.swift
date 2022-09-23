//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이정민 on 2022/09/23.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        return Formula()
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var components: [String] = [input]
        
        Operator.allCases.forEach { operant in
            let progressSplit = components
            components = []
            
            progressSplit.forEach { string in
                components += string.split(with: operant.rawValue)
            }
        }
        
        return components
    }
    }
}
