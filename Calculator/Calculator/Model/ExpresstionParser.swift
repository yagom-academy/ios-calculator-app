//
//  ExpresstionParser.swift
//  Calculator
//
//  Created by 권나영 on 2021/11/14.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandsStack: [Double] = componentsByOperators(from: input).compactMap{ Double($0) }
        let operands = CalculateItemQueue(enqueueStack: operandsStack)
        
        let operatorStack: [Operator] = input.compactMap{ Operator(rawValue: $0) }
        let operators = CalculateItemQueue(enqueueStack: operatorStack)
        
        return Formula(operands: operands, operators: operators)
    }

    static private func componentsByOperators(from input: String) -> [String] {
        var result: String = input
        let allOperators = Operator.allCases.map{ String($0.rawValue) }
        
        allOperators.forEach { `operator` in
            result = result.replacingOccurrences(of: `operator`, with: " ")
        }
        return result.split(with: " ")
    }
}
