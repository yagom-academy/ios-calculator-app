//  ExpressionParser.swift
//  Calculator
//  Created by LIMGAUI on 2022/03/20

import Foundation

enum ExpressionParser {
    static private func componenetsByOperators(from input: String) -> [String] {
        var operands = [String]()
        input.forEach {
            if let _ = Operator(rawValue: $0) {
            } else {
                operands.append(String($0))
            }
        }
        return operands
    }
}
