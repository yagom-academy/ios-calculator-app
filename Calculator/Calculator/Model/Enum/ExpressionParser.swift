//
//  ExpressionParser.swift
//  Calculator
//
//  Created by dragon on 2022/09/23.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        let operandList = componentsByOperators(from: input)
        var operandComponents = [String]()
        for i in 0...operandList.count-1 {
            operandComponents.append(operandList[i].trimmingCharacters(in: .whitespaces))
        }
        operandComponents.compactMap{ Double($0) }.forEach{ operands.enqueue(element:  $0)}
        let operatorComponents = input.compactMap{ Operator(rawValue: $0) }
        operatorComponents.forEach{ operators.enqueue(element: $0) }
        
        let result = Formula(operands: operands, operators: operators)
        return result
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators = CharacterSet(charactersIn: Operator.allCases.map{ String($0.rawValue) }.joined())
        return input.components(separatedBy: operators)
    }
}
