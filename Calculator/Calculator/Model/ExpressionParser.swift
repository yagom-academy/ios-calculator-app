//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 무리 on 2023/01/30.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let components = componentsByOperators(from: input)
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Operator>()

        components.compactMap({ Double($0) })
            .forEach { operandsQueue.enqueue($0) }
        
        components.filter({ $0.count == 1 }).compactMap({ Operator(rawValue: Character($0)) })
            .forEach { operatorsQueue.enqueue($0) }

        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let splitedInput = input.split(with: " ")
        
        return splitedInput
    }
}
