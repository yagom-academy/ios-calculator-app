//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Zion & Dasan on 2023/06/02.
//

enum ExpressionParser<OperandQueue: Queueable, OperatorQueue: Queueable> where OperandQueue.Element == Double, OperatorQueue.Element == Operator {
    static func parser(from input: String) -> Formula<OperandQueue, OperatorQueue> {
        var operandQueue = OperandQueue()
        var operatorQueue = OperatorQueue()
        
        componentsByOperators(from: input)
            .compactMap { Double($0) }
            .forEach { operandQueue.enqueue($0) }
    
        input
            .filter { $0.isNumber == false }
            .compactMap { Operator(rawValue: $0) }
            .forEach { operatorQueue.enqueue($0) }
        
        let formula = Formula(operands: operandQueue, operators: operatorQueue)
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operands = Operator.allCases.reduce([input]) { accumulatedArray, operatorItem in
            accumulatedArray
                .map { $0.split(with: operatorItem.rawValue) }
                .flatMap { $0 }
        }
        
        return operands
    }
}
