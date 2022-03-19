//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/18.
//

import Foundation

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        let componentsString = componentsByOperators(from: input)
        var values = LinkedQueue<Double>()
        var oper = LinkedQueue<Operator>()
        
        componentsString.forEach{
            if Double($0) != nil {
                values.append(newNode: Double($0))
            } else {
                let convertOper = Operator(rawValue: Character($0))
                oper.append(newNode: convertOper)
            }
        }
        
        return Formula(operands: values, operators: oper)
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
