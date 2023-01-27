//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Harry on 2023/01/27.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>(list: LinkedList())
        var operators = CalculatorItemQueue<Operator>(list: LinkedList())
        
        let components = componentsByOperators(from: input)
        
        components.forEach {
            if let operand = Double($0) {
                operands.enqueue(operand)
            } else if let `operator` = Operator(rawValue: Character($0)) {
                operators.enqueue(`operator`)
            }
        }
        
        let formula = Formula(operands: operands, operators: operators)
        
        return formula
    }

    static func componentsByOperators(from input: String) -> [String] {
        let components = input.split(with: " ")
        
        return components
    }
}

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
