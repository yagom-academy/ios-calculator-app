//
//  ExpressionParser.swift
//  Calculator
//
//  Created by yeha on 2021/11/15.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        return makeOperationQueue(from: input)
    }
    
    private static func makeOperationQueue(from input: String) -> Formula {
        let operatorQueue = insertOperatorsToQueue(from: input)
        let operandQueue = insertOperandsToQueue(from: input)
        
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    private static func insertOperatorsToQueue(from input: String) -> CalculatorItemQueue<Operator> {
        var operatorQueue = CalculatorItemQueue<Operator>()
        let operatorsSymbols = Operator.allCases.map { $0.symbols }

        input.filter { operatorsSymbols.contains($0) }.forEach {
            guard let singleOperator = Operator(symbols: $0) else { return }
            operatorQueue.enqueue(singleOperator)
        }
        
        return operatorQueue
    }
    
    private static func insertOperandsToQueue(from input: String) -> CalculatorItemQueue<Double> {
        var operandQueue = CalculatorItemQueue<Double>()
        
        componentsByOperators(from: input).forEach { singleOperand in
            guard let convertedOperand = Double(singleOperand) else { return }
            operandQueue.enqueue(convertedOperand)
        }
        
        return operandQueue
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var componentsWithoutOperators: [String] = []
        
        componentsWithoutOperators = Operator.allCases.reduce([input]) { (splitInput, operatorInInput) in
            splitInput.flatMap { $0.split(with: operatorInInput.symbols) }
        }
        
        return componentsWithoutOperators
    }
}
