//
//  ExpressionParser.swift
//  Calculator
//
//  Created by mireu on 2023/10/06.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let numbers = componentsByOperators(from: input)
        let operators = input.compactMap { char in
            Operator(rawValue: char)
        }
        
        numbers.forEach {
            guard let number = Double($0) else { return }
            formula.operands.enqueue(number)
        }
        
        operators.forEach {
            formula.operators.enqueue($0)
        }
        
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var components = [input]
        
        Operator.allCases.forEach { operatorSymbol in
            components = components.flatMap { str in
                str.split(with: operatorSymbol.rawValue)
            }
        }
        
        return components.filter { $0 != "" }
    }
}
