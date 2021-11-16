//
//  ExpressionParser.swift
//  Calculator
//
//  Created by yeha on 2021/11/15.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Operator {
        let operatorRawValues = Operator.allCases.map { $0.rawValue }
        var testResult: Operator = .subtract
//        var operatorQueue = CalculatorItemQueue<Operator>()

        input.filter { operatorRawValues.contains($0) }.forEach {
            guard let operatorItem = Operator(rawValue: $0) else { return }
            testResult = operatorItem
//            operatorQueue.enqueue(operatorItem)
        }
        return testResult
//        return operatorQueue
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        var operands: [String] = []
        
        operands = Operator.allCases.reduce([input]) { (splitInput, operatorInInput) in
            splitInput.flatMap { $0.split(with: operatorInInput.rawValue)}
        }
        return operands
    }
}
