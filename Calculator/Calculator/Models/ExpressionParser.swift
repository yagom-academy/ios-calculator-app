//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Kyo on 2022/09/22.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let divided = ExpressionParser.componentsByOperators(from: input)
        let operands = divided.compactMap { Double($0) }
        let operators = input.compactMap { Operator(rawValue: $0) }
        
        let operandsToQueue = CalculatorItemQueue<Double>()
        operands.forEach { operandsToQueue.enqueue($0)}
        
        let operatorsToQueue = CalculatorItemQueue<Operator>()
        operators.forEach{ operatorsToQueue.enqueue($0)}
        
        return Formula(operands: operandsToQueue, operators: operatorsToQueue)
    }

    private static func componentsByOperators(from input: String) -> [String] {
        let operatorTypes = Operator.allCases.map { String($0.rawValue) }
        var operatorSet: CharacterSet = CharacterSet()
        operatorTypes.forEach { operatorSet.insert(charactersIn: $0) }
        let components = input.components(separatedBy: operatorSet)

        return components
    }
}
