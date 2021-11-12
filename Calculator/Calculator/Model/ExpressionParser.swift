//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/10.
//

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Operator>()
        
        let operatorSet = Operator.allCases.map { $0.rawValue }
        let operands = componentsByOperators(from: input)
        let operators = input.split(with: " ")
                .filter { operatorSet.contains(Character($0)) }
                .compactMap { Operator(rawValue: Character($0)) }

        operands.forEach { operandsQueue.enqueue($0) }
        operators.forEach { operatorsQueue.enqueue($0) }

        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [Double] {
        let result = input.split(with: " ")

        return result.compactMap { Double($0) }
    }
}
