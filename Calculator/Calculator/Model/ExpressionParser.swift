//
//  ExpressionParser.swift
//  Calculator
//
//  Created by junho lee on 2022/09/23.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var result: Formula = Formula()
        
        componentsByOperators(from: input).compactMap { Double($0) }.forEach {
            result.operands.enqueue($0)
        }
        
        var inputRemovedNegativeSignal: String = input
        if input.hasPrefix("-") {
            inputRemovedNegativeSignal.removeFirst()
        }
        Operator.allCases.forEach {
            inputRemovedNegativeSignal = inputRemovedNegativeSignal.replacingOccurrences(of: "\($0.rawValue)-", with: "\($0.rawValue)")
        }
        inputRemovedNegativeSignal.compactMap { Operator.init(rawValue: $0) }.forEach {
            result.operators.enqueue($0)
        }
        
        return result
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: Array<String> = [input]
        for operatorCase in Operator.allCases {
            result = result.flatMap { $0.split(with: operatorCase.rawValue) }
        }
        var isNegative: Bool = false
        result = result.compactMap {
            if $0 == "" {
                isNegative = true
                return nil
            } else {
                let value: String = isNegative ? "-\($0)" : $0
                isNegative = false
                return value
            }
        }
        return result
    }
}
