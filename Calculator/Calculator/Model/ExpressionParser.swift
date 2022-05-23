//
//  ExpressionParser.swift
//  Calculator
//
//  Created by dhoney96 on 2022/05/20.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operators = CalculatorItemQueue<String>()
        var operands = CalculatorItemQueue<Double>()
        
        let components = componentsByOperators(from: input)
        
        components.forEach { item in
            if Double(item) == nil {
                operators.enqueue(item)
            } else {
                guard let number = Double(item) else { return }
                operands.enqueue(number)
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
