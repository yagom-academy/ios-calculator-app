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
        
        var isNegative: Bool = false
        componentsByOperators(from: input).forEach {
            if let operand: Double = Double($0) {
                result.operands.enqueue(isNegative ? -operand : operand)
                isNegative = false
            } else if $0 == "-" {
                isNegative = true
            }
        }
        
        var inputRemovedNegativeSignal: String = input
        if input.hasPrefix("-") {
            inputRemovedNegativeSignal.removeFirst()
        }
        Operator.allCases.forEach {
            inputRemovedNegativeSignal = inputRemovedNegativeSignal.replacingOccurrences(of: "\($0.rawValue)-", with: "\($0.rawValue)")
        }
        let filteredOperators: String = inputRemovedNegativeSignal.filter("+-×÷".contains)
        filteredOperators.compactMap { Operator.init(rawValue: $0) }.forEach {
            result.operators.enqueue($0)
        }
        
        return result
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: Array<String> = [input]
        for operatorCase in Operator.allCases {
            result = result.flatMap { $0.split(with: operatorCase.rawValue) }
        }
        return result.map { $0 == "" ? "-" : $0 }
    }
}
