//
//  ExpressionParser.swift
//  Calculator
//
//  Created by mireu on 2023/10/06.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandComponents = componentsByOperators(from: input)
        let operatorsComponents = componentsByOperators(from: input)
        
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        operandComponents.forEach { component in
            if let oprand = Double(component) {
                operands.enqueue(oprand)
            }
        }
        
        operatorsComponents.forEach { component in
            if let oprators = Operator(rawValue: Character(component)) {
                operators.enqueue(oprators)
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
