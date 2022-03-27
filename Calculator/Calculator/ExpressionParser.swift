//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Eddy on 2022/03/20.
//

import Foundation

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        let operandQueue: CalculatorItemQueue<Double> = CalculatorItemQueue()
        let operatorQueue: CalculatorItemQueue<Operator> = CalculatorItemQueue()
        
        componentsByOperators(from: input).compactMap { element in
            Double(element)
        }.forEach { elementOperand in
            operandQueue.enqueue(elementOperand)
        }
        
        componentsByOperators(from: input).filter { number in
            number.count == 1
        }.compactMap { element in
            Operator(rawValue: Character(element))
        }.forEach { elementOperator in
            operatorQueue.enqueue(elementOperator)
        }
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    func componentsByOperators(from input: String) -> [String] {
        let result = input.split(with: " ")
        return result
        
    }
}
