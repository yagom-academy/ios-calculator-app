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
        let convertDouble = componentsString.compactMap{ Double($0) }
        convertDouble.forEach{ values.append(newNode: $0) }
        
        var oper = LinkedQueue<Operator>()
        let converteOper = componentsString.compactMap{ Operator(rawValue: Character($0)) }
        converteOper.forEach{ oper.append(newNode: $0) }
    
        let calculator = Formula(operands: values, operators: oper)
        return calculator
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
