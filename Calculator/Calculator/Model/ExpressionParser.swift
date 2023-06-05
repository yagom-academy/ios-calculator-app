//
//  ExpressionParser.swift
//  Calculator
//
//  Created by mint on 2023/06/02.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let components = componentsByOperators(from: input)
        let operands = components.filter { Double($0) != nil }
        let operators = components.filter { Double($0) == nil }
        
        for index in operands {
            guard let operand = Double(index) else { continue }
            formula.operands.enqueue(operand)
        }
        
        for index in operators {
            guard let `operator` = Operator(rawValue: Character(index)) else { continue }
            formula.operators.enqueue(`operator`)
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
//        var options = Operator.allCases
//            .map { $0.rawValue }
//            .filter { input.contains($0) }
        
        return input.split(with: " ")
    }
}
