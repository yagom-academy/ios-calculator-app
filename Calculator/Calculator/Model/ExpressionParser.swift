//
//  ExpressionParser.swift
//  Created by 미니.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let otherSpecial: CharacterSet = ["^", "!", "@", "#", "$", "%", "&"]
        let removedSpecial = input.components(separatedBy: otherSpecial).joined()
        
        let removedPlain = removedSpecial.filter {
            Double(String($0)) != nil || Operator(rawValue: $0) != nil || $0 == " "
        }
        
        let operatorElements = removedPlain.split(separator: " ")
            .map { $0.description }
            .filter { Double($0) == nil }
        let operators: [Operator] = operatorElements.compactMap { Operator(rawValue: Character($0)) }
        
        let operands: [Double] = componenetsByOperators(from: removedPlain).compactMap { Double($0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componenetsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { $0.rawValue }
        var result: String = input
        
        operators.forEach { result = result.split(with: $0).joined() }
        result = result.replacingOccurrences(of: "  ", with: "")
        
        return result.split(separator: " ").map { $0.description }
    }
}
