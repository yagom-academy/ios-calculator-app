//
//  ExpressionParse.swift
//  Calculator
//
//  Created by Baek on 2022/05/23.
//

import Foundation

enum ExpressParser {
    func parse(form input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators =  CalculatorItemQueue<Operator>()
        let divideString = componetsByOperators(from: input)
        
        for parseString in divideString {
            
            if let parseNumber = Double(parseString) {
                operands.enqueue(parseNumber)
            } else if let parseArithmetic = Operator(rawValue: Character(parseString)) {
                operators.enqueue(parseArithmetic)
            }
        }
        return Formula(operands: operands, operators: operators)
    }
    
    private func componetsByOperators(from input: String) ->[String] {
        return input.split(with: " ")
    }
}
