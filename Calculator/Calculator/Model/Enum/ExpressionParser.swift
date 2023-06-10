//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/31.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operatorsQueue = CalculatorItemQueue<Operator>()
        var operandsQueue = CalculatorItemQueue<Double>()

        let operandComponents = self.componentsByOperators(from: input).compactMap { NSDecimalNumber(string:$0).doubleValue
        }
        let operatorComponents = input.compactMap { Operator(rawValue: $0) }
        
        operandComponents.forEach { operandsQueue.enqueue($0) }
        operatorComponents.forEach { operatorsQueue.enqueue($0) }

        return Formula(operands:operandsQueue, operators: operatorsQueue)
    }
        
    static private func componentsByOperators(from input: String) -> [String] {
        return Operator.allCases.reduce([input]) { resultArray, operatorItem in
            resultArray.map { $0.split(with:operatorItem.rawValue) }.flatMap { $0 }
        }
    }
}
