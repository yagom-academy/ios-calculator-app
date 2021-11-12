//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/12.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operatorRawValues = Operator.allCases.map { $0.rawValue }
        var operandQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        input.filter { operatorRawValues.contains($0) }.forEach {
            guard let operatorItem = Operator(rawValue: $0) else { return }
            operatorQueue.enqueue(operatorItem)
        }

        componentsByOperators(from: input).forEach {
            guard let converted = Double($0) else { return }
            operandQueue.enqueue( converted )
        }
        
        return Formula(operands: operandQueue, operators: operatorQueue)
    }

    private static func componentsByOperators(from input: String) -> [String] {
        Operator.allCases.reduce([input]) { (array, operator) in
            array.map { $0.split(with: `operator`.rawValue) }
                .flatMap { $0 }.compactMap { String($0) }
        }
    }
}
