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
        
        let operatorSet = Operator.allCases.map { String($0.rawValue) }
        let operands = componentsByOperators(from: input).compactMap{ Double($0) }
        let operators = input.split(with: " ")
                .filter { operatorSet.contains($0) }
                .compactMap { Operator(rawValue: Character($0)) }

        operands.forEach { operandsQueue.enqueue($0) }
        operators.forEach { operatorsQueue.enqueue($0) }

        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
            .compactMap { Double($0) }
            .map { String($0) }
    }
}
