//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김성준 on 2023/01/27.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let components: [String] = input.split(with: " ")
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<String>()
        
        for component in components {
            guard let operand = Double(component) else {
                operators.enqueue(component)
                continue
            }
            operands.enqueue(operand)
        }
        let formula = Formula(operands: operands, operators: operators)
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return []
    }
}
