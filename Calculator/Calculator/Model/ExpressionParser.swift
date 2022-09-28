//
//  ExpressionParser.swift
//  Created by 미니.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = componenetsByOperators(from: input).compactMap(Double.init)
        let operators = componentsByOperands(from: input).compactMap { Operator(rawValue: $0) }
        return Formula(operands: operands, operators: operators)
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
    
    private static func componentsByOperands(from input: String) -> [Character] {
        let operators = Operator.allCases.map(\.rawValue)
        var input: String = input
        
        if input.first == Operator.subtract.rawValue {
            input.removeFirst()
        }
        
        operators.forEach { sign in
            input = input.replacingOccurrences(of: "\(sign)-", with: "\(sign)")
        }
        
        return input.filter { !$0.isNumber }
    }
}
