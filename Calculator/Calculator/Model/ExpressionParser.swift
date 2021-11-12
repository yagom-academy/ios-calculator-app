//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이차민 on 2021/11/12.
//

import Foundation

enum ExpressionParser {
    static private let separator: Character = " "
    
    static func parse(from input: String) -> Formula {
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator>()
        
        let operatorStringsSet = Set(Operator.allCases.map { String($0.rawValue) })
            
        input.split(with: separator)
            .filter { operatorStringsSet.contains($0) }
            .compactMap { Operator(rawValue: Character($0)) }
            .forEach { arithmetic in
                operators.enqueue(arithmetic)
            }
        
        componentsByOperators(from: input)
            .compactMap { Double($0) }
            .forEach { number in
                operands.enqueue(number)
            }
            
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: separator)
            .compactMap { Double($0) }
            .map { String($0) }
    }
}
