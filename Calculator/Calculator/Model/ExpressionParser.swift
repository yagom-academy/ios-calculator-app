//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Hmeg on 2023/06/06.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandQueue = CalculatorItemQueue<Double>()
        let operatorQueue = CalculatorItemQueue<Operator>()
        
        let components = componentsByOperators(from: input)
        
        for component in components {
            if let number = Double(component) {
                operandQueue.enqueue(item: number)
            } else if let currentOperator = Operator(rawValue: Character(component)) {
                operatorQueue.enqueue(item: currentOperator)
            }
        }
        
        let formula = Formula(operands: operandQueue, operators: operatorQueue)
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators: [Character] = ["+", "-", "/", "*"]
        return operators.flatMap {input.split(with: $0)}
    }
}
