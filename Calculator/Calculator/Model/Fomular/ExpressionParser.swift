//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/18.
//

import Foundation

enum ExpressionParser {
    @discardableResult
    static func parse(from input: String) -> Formula {
        let operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
        let operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
        
        input.split(with: " ")
            .compactMap{ Double($0) }
            .forEach{ value in
                operands.enqueue(value)
            }
            
        componentsByOperators(from: input)
            .compactMap{ Character($0) }
            .forEach{ value in
                guard let operatorValue = Operator(rawValue: value),
                      Operator.allCases.contains(operatorValue) else {
                    return
                }
                operators.enqueue(operatorValue)
            }
        
        return Formula(operands: operands, operators: operators)
    }
}

extension ExpressionParser {
    static func componentsByOperators(from input: String) ->[String] {
        let data = input
            .split(with: " ")
            .filter{ Double($0) == nil }
            
        return data
    }
}
