//
//  ExpressionParser.swift
//  Created by 미니.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        componenetsByOperators(from: input)
        return Formula()
    }
    
    private static func componenetsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map(\.rawValue)
        var splitValues: [String] = [input]
        var result: [String] = []
        
        operators.forEach { sign in
            splitValues = splitValues.flatMap { $0.split(with: sign) }
        }
        
        for index in 0..<splitValues.count {
            var value: String = splitValues[index]
            
            if index > 0, splitValues[index - 1] == "" {
                value = "-\(splitValues[index])"
            }
            
            result.append(value)
        }
        
        return result.filter { $0 != "" }
    }
}
