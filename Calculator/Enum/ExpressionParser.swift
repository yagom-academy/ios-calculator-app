//
//  ExpressionParser.swift
//  Calculator
//
//  Created by unchain123 on 2022/05/22.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let results = self.split(separator: target)
        let result = results.map { String($0) }
        
        return  result
    }
}

enum ExpressionPaser {
    static private func componentsByoperator(from input: String) -> [String] {
        let result = input.split(with: " ")
        
        return result
    }
    
    static func parse(from input: String) -> Formula {
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Character>()
        
        let paser = componentsByoperator(from: input)
        let allOperator = Operator.allCases.map { String($0.rawValue) }
        
        let operands = paser.compactMap{ Double($0) }
        let operators = paser.filter {
            allOperator.contains($0)
        }
        
        operators.forEach {
            operatorsQueue.enQueue(Character($0))
        }
        
        operands.forEach(operandsQueue.enQueue(_:))
        
        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
}
