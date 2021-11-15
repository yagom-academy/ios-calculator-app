//
//  ExpressionParser.swift
//  Calculator
//
//  Created by yeha on 2021/11/15.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Operator {
//        let filtered: (String) -> Bool = { $0.contains("+") }
//        return filtered(input)
        
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

    private static func componentsByOperators(from input: String) -> [String] {
        let result = input.split(with: " ")
        return result
    }
}
