//
//  ExpressionParser.swift
//  Calculator
//
//  Created by mint on 2023/06/02.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let elements = componentsByOperators(from: input)
        var operands = CalculatorItemQueue<Double>()
        
        for index in elements {
            guard let element = Double(index) else { continue }
            operands.enqueue(element)
        }
        
        let symbols = input.split(with: " ").filter { Double($0) == nil }
        var operators = CalculatorItemQueue<Operator>()
        
        for index in symbols {
            guard let symbol = Operator(rawValue: Character(index)) else { continue }
            operators.enqueue(symbol)
        }
        
        return Formula(operators: operators, operands: operands)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
//        var options = Operator.allCases
//            .map { $0.rawValue }
//            .filter { input.contains($0) }
        
        return input.split(with: " ").filter { Double($0) != nil }
    }
}
