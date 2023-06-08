//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 박종화 on 2023/06/02.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        let operandComponents = componentsByOperators(from: input)
        let operatorComponents = componentsByOperators(from: input)
                
        operandComponents
            .compactMap{ Double($0) }
            .forEach{ operands.enqueue($0) }
        
        operatorComponents
            .compactMap{ Operator(rawValue: Character($0)) }
            .forEach{ operators.enqueue($0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}

