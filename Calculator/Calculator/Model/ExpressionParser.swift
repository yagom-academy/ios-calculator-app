//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/18.
//

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        
        let componentsString = componentsByOperators(from: input)
        var values = LinkedQueue<Double>()
        var oper = LinkedQueue<Operator>()
        
        componentsString.forEach{
            if let number = Double($0) {
                values.append(newNode: number)
            } else if let convertOper = Operator(rawValue: Character($0)) {
                oper.append(newNode: convertOper)
            }
        }
        
        return Formula(operands: values, operators: oper)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
