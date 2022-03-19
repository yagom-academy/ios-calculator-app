//
//  ExpressionParser.swift
//  Calculator
//
//  Created by marisol on 2022/03/18.
//

import Foundation

enum ExpressionParser {
    public func parse(from input: String) -> Formula {
        var formula: Formula = Formula()
        let elementArray = componentsByOperators(from: input)
        var operandArray: [String] = []
        var operatorArray: [String] = []
        
        for index in 0..<elementArray.count {
            (index % 2) == 0 ? operandArray.append(elementArray[index]) : operatorArray.append(elementArray[index])
        }
        
        let doubleTypeArray = operandArray.map { Double($0) ?? 0 }
        for element in doubleTypeArray {
            formula.operands?.enqueue(element)
        }
        
        let characterTypeArray = operatorArray.map { Character($0) }
        let operatorTypeArray = characterTypeArray.map { Operator(rawValue: $0) ?? Operator.subtract }
        for element in operatorTypeArray {
            formula.operators?.enqueue(element)
        }
        return formula
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
