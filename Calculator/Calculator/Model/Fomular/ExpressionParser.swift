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
        let formula = Formula()
        
        componentsByOperators(from: input)
            .compactMap{ Double($0) }
            .forEach{ value in
                formula.operands.enqueue(value)
            }
            
        input.split(with: " ")
            .filter { Double($0) == nil }
            .compactMap{ Character($0) }
            .forEach{ value in
                guard let operatorValue = Operator(rawValue: value),
                      Operator.allCases.contains(operatorValue) else {
                    return
                }
                formula.operators.enqueue(operatorValue)
            }
        
        return Formula(operands: formula.operands, operators: formula.operators)
    }
}

extension ExpressionParser {
    static func componentsByOperators(from input: String) ->[String] {
        let operatorList: [String] = Operator.allCases.map { String($0.rawValue) }
        var data = input.split(with: " ")
        data.removeAll { operatorList.contains($0) }
        
        return data
    }
}
