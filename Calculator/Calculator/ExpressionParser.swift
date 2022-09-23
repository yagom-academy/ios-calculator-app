//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Gundy on 2022/09/22.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands: CalculatorItemQueue<Double> = .init()
        var operators: CalculatorItemQueue<Operator> = .init()
        componentsByOperators(from: input)
            .compactMap(Double.init)
            .forEach { operands.enqueue($0) }
        let calculateSigns: [Operator] = input.compactMap { Operator(rawValue: $0) }
        calculateSigns.forEach { operators.enqueue($0) }
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let separator: String = String(Operator.allCases.map(\.rawValue))
        let operators: CharacterSet = CharacterSet(charactersIn: separator)
        return input.components(separatedBy: operators).filter {$0 != "" }
    }
}
