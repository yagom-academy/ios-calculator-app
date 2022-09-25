//
//  ExpressionParser.swift
//  Created by Wonbi
//

//import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator>()
        var fomula = Formula(operands: operands, operators: operators)
        
        let components = componentsByOperators(from: input)
        components.forEach { component in
            if let operand = Double(component) {
                fomula.operands.enqueue(operand)
            } else if let componentOperator = Operator(rawValue: Character(component)) {
                fomula.operators.enqueue(componentOperator)
            }
        }
        
        return fomula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let result = input.split(wiht: " ")
        
        return result
    }
}
