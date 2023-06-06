//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Erick on 2023/06/01.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        let components = componentsByOperators(from: input)
        
        components
            .compactMap { Double($0) }
            .forEach { operands.enqueue($0) }
        
        components
            .filter { $0.count == 1 }
            .compactMap { Operator(rawValue: Character($0)) }
            .forEach { operators.enqueue($0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
