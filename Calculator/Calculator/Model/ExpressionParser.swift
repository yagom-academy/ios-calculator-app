//
//  ExpressionParser.swift
//  Calculator
//
//  Created by kimseongjun on 2023/01/27.
//

import Foundation

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Operator>()
        
        
        let separatedOperators = input.compactMap { Operator(rawValue: $0) }
       separatedOperators.forEach { `operator` in
            operatorsQueue.enqueue(item: `operator`)
        }
       
        let separatedOperands = componentsByOperators(from: input).compactMap { Double($0) }
            separatedOperands.forEach { operand in
            operandsQueue.enqueue(item: operand)
        }
        
        var currentFomula = Formula()
        currentFomula.operands = operandsQueue
        currentFomula.operators = operatorsQueue
        return currentFomula
    }
    
    func componentsByOperators(from input: String) -> [String] {
        var numbers: [String] = [input]
        Operator.allCases.forEach { `operator` in
            numbers = numbers.map { $0.split(with: `operator`.rawValue) }.flatMap { $0 }
        }
        return numbers
    }
}
