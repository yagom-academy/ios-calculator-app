//
//  ExpressionParser.swift
//  Calculator
//
//  Created by jyubong,Morgan.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = CalculatorItemQueue<Double>(list: LinkedList())
        let operators = CalculatorItemQueue<Operator>(list: LinkedList())
        let components = componentsByOperator(from: input)
        
        components.forEach {
            if let operand = Double($0) {
                operands.enQueue(operand)
            }
        }
        
        input.forEach {
            if let `operator` = Operator(rawValue: $0) {
                operators.enQueue(`operator`)
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperator(from input: String) -> [String] {
        var splitedInput = [input]
        
        Operator.allCases.forEach { `operator` in
            splitedInput = splitedInput.flatMap { $0.split(with:`operator`.rawValue) }
        }
        
        return splitedInput
    }
}
