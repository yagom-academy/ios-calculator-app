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
        let result = results.map { (element: String.SubSequence) -> String in
            let result = String(element)
            return result
        }
        
        return  result
    }
}

enum ExpressionPaser {
    static private func componentsByOperator(from input: String) -> [String] {
        let result = input.split(with: " ")
        
        return result
    }
    
    static func parse(from input: String) -> Formula {
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Operator>()
        
        let paser = componentsByOperator(from: input)
        let allOperator = Operator.allCases.map { (symbol: Operator) -> String in
            let allOperator = String(symbol.rawValue)
            return allOperator
        }
        
        let operands = paser.compactMap { (element: String) -> Double? in
            return Double(element)
        }
        
        let operators = paser.filter { element -> Bool in
            allOperator.contains(element)
        }
        
        operators.forEach { element in
            operatorsQueue.enQueue(Operator(rawValue: Character(element)) ?? .add)
        }
        
        operands.forEach(operandsQueue.enQueue(_:))
        
        let calculationFormula = Formula(operands: operandsQueue, operators: operatorsQueue)
        
        return calculationFormula
    }
}
