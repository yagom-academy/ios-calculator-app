//
//  ExpressionParser.swift
//  Calculator
//
//  Created by jiye Yi on 2023/01/27.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let components = componentsByOperator(from: input)
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        components.compactMap({ Double($0) }).forEach{ operands.enqueue($0) }
        components.filter{ $0.count == 1 }.compactMap({ Operator(rawValue: Character($0)) }).forEach{ operators.enqueue($0) }

        let result: Formula = Formula(operands: operands, operators: operators)
        
        return result
    }
    
    private static func componentsByOperator(from input: String) -> [String] {
        return input.split(with: " ")
    }
    
}
