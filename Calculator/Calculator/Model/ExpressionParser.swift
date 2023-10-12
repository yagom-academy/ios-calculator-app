//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Kiseok on 2023/10/11.
//

enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        let components = componentsByOperators(from: input)
        let operands = CalculatorItemQueue<Double>(enqueueBox: [])
        let operators = CalculatorItemQueue<Operator>(enqueueBox: [])
        var formula = Formula(operands: operands, operators: operators)
        
        
        components.forEach {
            if let operands = Double($0) {
                formula.operands.enqueue(operands)
            } else if let operators = Operator(rawValue: Character($0)) {
                formula.operators.enqueue(operators)
            }
        }
        
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: "+", "-", "/", "*")
    }
}
