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
        
        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
//    
    func componentsByOperators(from input: String) -> [String] {
        var numbers: [String] = [input]
        Operator.allCases.forEach { oper in
            numbers = numbers.map { $0.split(with: oper.rawValue) }.flatMap { $0 }
        }
        return numbers
    }
}
