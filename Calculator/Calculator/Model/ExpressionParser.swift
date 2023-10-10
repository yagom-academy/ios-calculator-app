//
//  ExpressionParser.swift
//  Calculator
//
//  Created by jyubong on 10/10/23.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = CalculatorItemQueue<Double>(list: LinkedList())
        let operators = CalculatorItemQueue<Operator>(list: LinkedList())
        let components = componentsByOperator(from: input)
        
        components.forEach { component in
            if let operand = Double(component) {
                operands.enQueue(operand)
            } else if let `operator` = Operator(rawValue: Character(component)) {
                operators.enQueue(`operator`)
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperator(from input: String) -> [String] {
        return input.split(with: " ")
    }
}

extension String {
    func split(with target: Character) -> [String] {
        return split(separator: target).map{ String($0) }
    }
}
