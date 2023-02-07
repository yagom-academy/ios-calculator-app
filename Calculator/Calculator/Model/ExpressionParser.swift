//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 혜모리, 릴라 on 2023/01/27.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let components = componentsByOperators(from: input)
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator>()
        
        components.forEach { component in
            guard component.isEmpty == false else { return }
            
            if let operand = Double(component) {
                operands.enqueue(operand)
            } else if let operatorSign = Operator(rawValue: Character(component)) {
                operators.enqueue(operatorSign)
            }
        }
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let components = input.split(with: " ")
        return components
    }
}
