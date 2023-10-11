//
//  ExpressionParser.swift
//  Calculator
//
//  Created by mireu on 2023/10/06.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandcomponent = componentsByOperators(from: input)
        let operatorscomponent = componentsByOperators(from: input)
        
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        for component in operandcomponent {
            if let oprand2 = Double(component) {
                operands.enqueue(oprand2)
            }
        }
        
        for component in operatorscomponent {
                if let oprators2 = Operator(rawValue: Character(component)) {
                    operators.enqueue(oprators2)
                }
            }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
       
        return input.split(with: " ")
    }
}
