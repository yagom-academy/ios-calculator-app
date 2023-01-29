//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 천승현 on 2023/01/27.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        let opers = input.split(whereSeparator: { $0.isNumber || $0 == "." })
            
        opers.forEach { oper in
            if let operChar = oper.first, let oper = Operator.init(rawValue: operChar) {
                operators.enqueue(oper)
            }
        }
    
        componentnsByOperators(from: input)
            .map { $0.contains("⎼") ? ("-" + $0[$0.index(after: $0.startIndex)...]) : $0 }
            .compactMap{ Double($0) }
            .forEach { operands.enqueue($0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentnsByOperators(from input: String) -> [String] {
        var results: [String] = [input]
        
        Operator.allCases.forEach { oper in
            results = results.map { $0.split(with: oper.rawValue) }.flatMap { $0 }
        }
        return results
    }
}


