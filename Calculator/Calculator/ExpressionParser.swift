//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 정선아 on 2022/09/23.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let divided = ExpressionParser.componentsByOperators(from: input)
        let operands = divided.compactMap { Double($0) }
        let operators = divided.compactMap { Operator(rawValue: Character($0))}.map { $0.rawValue}
        
        var operandsToQueue = CalculatorItemQueue<Double>()
        operands.forEach { operandsToQueue.enQueue(element: $0)}
        
        var operatorsToQueue = CalculatorItemQueue<Character>()
        operators.forEach{ operatorsToQueue.enQueue(element: $0)}
        
        return Formula(operands: operandsToQueue, operators: operatorsToQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var arithmeticExpressionArray = [input]
        var tempArray: [String] = []
        
        Operator.allCases.forEach { oneOfOperator in
            let character = oneOfOperator.rawValue
            for arithmeticExpression in arithmeticExpressionArray {
                tempArray += arithmeticExpression.split(with: character)
                arithmeticExpressionArray = tempArray
                tempArray.removeAll()
            }
        }
        return arithmeticExpressionArray
    }
}
