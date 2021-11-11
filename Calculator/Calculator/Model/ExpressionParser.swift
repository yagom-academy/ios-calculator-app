//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/09.
//

import Foundation

enum ExpressionParser {
    case a
    
    func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Character>()
        
        let inputoperators = componentsByOperators(from: input)
        let inputoperands = input.components(separatedBy: " ")
        inputoperators.forEach { string in
            operators.enQueue(Character(string))
        }
        for string in inputoperands {
            if let operandForQueue = Double(string) {
                operands.enQueue(operandForQueue)
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        var separator: [String] = []
        
        Operator.allCases.forEach {
            separator.append(String($0.rawValue))
        }
        
        let array = input.map { String($0) }
        let OperatorArray = array.filter { separator.contains($0) }
     
        return OperatorArray
    }
}
