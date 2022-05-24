//
//  ExpressionParser.swift
//  Calculator
//
//  Created by dhoney96 on 2022/05/20.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operators = CalculatorItemQueue<Operator>()
        var operands = CalculatorItemQueue<Double>()
        
        let components = componentsByOperators(from: input)
        
        components.compactMap { element in
            Double(element)
        }.forEach { number in
            operands.enqueue(number)
        }
        
        components.filter {
            Double($0) == nil
        }.forEach { sign in
            guard let operatorSign = Operator(rawValue: Character(sign)) else {
                return
            }
            
            operators.enqueue(operatorSign)
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
