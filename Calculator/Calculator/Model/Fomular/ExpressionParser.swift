//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/18.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
        
        componentsByOperands(from: input).map{
            operands.enqueue(Double($0) ?? 0.0)
        }
        
        let operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
        
        componentsByOperators(from: input).map{
            operators.enqueue(Operator(rawValue: $0) ?? .add)
        }
        
        return Formula(operands: operands, operators: operators)
    }
}

extension ExpressionParser {
    static func componentsByOperators(from input: String) ->[Character] {
        let data = input
            .split(with: " ")
            .filter{ Double($0) == nil }
            .compactMap{ Character($0) }
            .filter{ Operator.contains($0) }

        return data
    }

    static func componentsByOperands(from input: String) ->[String] {
        let data = input
            .split(with: " ")
            .compactMap { Double($0) }
            .map{ String($0) }
        
        return data
    }
}
