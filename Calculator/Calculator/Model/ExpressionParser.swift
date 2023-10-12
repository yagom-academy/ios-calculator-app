//
//  ExpressionParser.swift
//  Calculator
//
//  Created by mireu on 2023/10/06.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandComponent = componentsByOperators(from: input)
        let operatorsComponent = componentsByOperators(from: input)
        
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        operandComponent.forEach{ component in
            if let oprand = Double(component) {
                operands.enqueue(oprand)
            }
        }
        
        operatorsComponent.forEach{ component in
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
