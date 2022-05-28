//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 재재 on 2022/05/25.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let splited = ExpressionParser.componentsByOperators(from: input)
        let operands = splited.compactMap { Double($0) }
        let operators = splited.compactMap { OperatorItem(rawValue: Character($0)) }.map { $0.rawValue }
        
        var operandsQueue = CalculatorItemQueue<Double>()
        operands.forEach { operandsQueue.enqueue($0) }
        var operatorsQueue = CalculatorItemQueue<Character>()
        operators.forEach { operatorsQueue.enqueue($0) }
        
        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var inputArray = [input]
        var tempArray: [String] = []
        
        OperatorItem.allCases.forEach { eachOperator in
            let a = eachOperator.rawValue
            for i in inputArray {
                tempArray += i.split(with: a)
                inputArray = tempArray
                tempArray.removeAll()
            }
        }
        return inputArray
    }
}
