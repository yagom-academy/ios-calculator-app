//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Hyungmin Lee on 2023/06/02.
//
let input = "-3/3*0-1"

enum ExpressionParser {
    static func parse(from input2: String) -> Formula {
        
        var operandComponents = componentsByOperators(from: input).compactMap { return Double($0) }
        var operatorComponents = input.compactMap { Operator(rawValue: $0) }
        
        if operandComponents.count == operatorComponents.count {
            operandComponents[0] = -operandComponents[0]
            operatorComponents.removeFirst()
        }
        
        var operandQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        operandComponents.forEach { operandQueue.enqueue(element: $0) }
        operatorComponents.forEach{ operatorQueue.enqueue(element: $0) }
        
        let formula = Formula(operands: operandQueue, operators: operatorQueue)
        
        return formula
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        return input.components(separatedBy: ["+", "-","*","/"])
    }
}
