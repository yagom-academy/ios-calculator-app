//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Hyungmin Lee on 2023/06/02.
//

enum ExpressionParser<OperandQueue: Queueable, OperatorQueue: Queueable> where OperandQueue.Element == Double, OperatorQueue.Element == Operator {
    static func parse(from input: String) -> Formula<OperandQueue, OperatorQueue> {
        var operatorQueue = OperatorQueue()
        var operandQueue = OperandQueue()
        
        input
            .compactMap { Operator(rawValue: $0) }
            .forEach {
            operatorQueue.enqueue(element: $0)
        }
        
        componentsByOperators(from: input)
            .compactMap { return Double($0) }
            .forEach {
            operandQueue.enqueue(element: $0)
        }
        
        let formula = Formula(operands: operandQueue, operators: operatorQueue)
        
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
      return input.components(separatedBy: ["+", "−", "×", "÷"])
    }
}
