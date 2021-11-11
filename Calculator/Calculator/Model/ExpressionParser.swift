//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/09.
//

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        let inputOperators = componentsByOperators(from: input)
        let inputOperands = input.split(with: " ")
        
        inputOperators.forEach {
            inputOperator in
            operators.enQueue(Operator(rawValue: Character(inputOperator)))
        }
        inputOperands.compactMap{ Double($0) }.forEach {
            operand in operands.enQueue(operand)
        }
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.filter { input.contains($0.rawValue) }
     
        return operators.map { String($0.rawValue) }
    }
}
