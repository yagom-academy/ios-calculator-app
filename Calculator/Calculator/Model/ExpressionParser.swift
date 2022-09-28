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
        
        var inputRemovedFirstNegative: String = input
        let isFirstLetterNegative: Bool = inputRemovedFirstNegative.hasPrefix("-")
        if isFirstLetterNegative {
            inputRemovedFirstNegative.removeFirst()
        }
        let inputRemovedNegative: String = removeNegative(from: inputRemovedFirstNegative)
        inputRemovedNegative.compactMap {
            if let operatorToReturn = Operator.init(rawValue: $0) {
                return operatorToReturn
            } else {
                return nil
            }
        }.forEach {
            result.operators.enqueue($0)
        }
        
        return result
    }
    
    private static func removeNegative(from input: String) -> String {
        var inputRemovedNegative: String = input
        Operator.allCases.forEach {
            inputRemovedNegative = inputRemovedNegative.replacingOccurrences(of: "\($0.rawValue)-", with: "\($0.rawValue)")
        }
        return inputRemovedNegative
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: Array<String> = [input]
        for operatorCase in Operator.allCases {
            result = result.flatMap { $0.split(with: operatorCase.rawValue) }
        }
        var isNegative: Bool = false
        result = result.compactMap {
            let isNumber: Bool = $0 != ""
            if isNumber {
                let value: String = isNegative ? "-\($0)" : $0
                isNegative = false
                return value
            } else {
                isNegative = true
                return nil
            }
        }
        return result
    }
}
