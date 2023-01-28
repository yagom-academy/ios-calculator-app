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
        
        components.forEach {
            if let validOperands = Double($0) {
                operands.enqueue(validOperands)
            } else if let validOperators = Operator(rawValue: Character($0)) {
                operators.enqueue(validOperators)
            }
        }
        
        var result: Formula = Formula(operands: operands, operators: operators)
        
        return result
    }
    
    private static func componentsByOperator(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
