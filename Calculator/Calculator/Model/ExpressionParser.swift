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
        
        let _ = components.filter { element in
            Double(element) != nil
        }.map {
            Double($0)
        }.forEach { number in
            guard let data = number else { return }
            operands.enqueue(data)
        }
        
        let _ = components.filter { element in
            Double(element) == nil
        }.forEach { sign in
            operators.enqueue(sign)
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
