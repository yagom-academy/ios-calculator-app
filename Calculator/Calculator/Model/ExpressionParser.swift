//  ExpressionParser.swift
//  Calculator
//  Created by LJ on 2022/09/23.

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula: Formula = Formula()
        let separatedInputOperands: [String] = componentsByOperators(from: input)
        
        let convertedToDoubleOperands: [Double] = separatedInputOperands.map {
            (operand: String) -> Double in
            return Double(operand) ?? 99.999
        }
        for operand in convertedToDoubleOperands {
            formula.operands.enqueue(element: operand)
        }

        let separatedOperators: [Character] = input.filter {
            (input: Character ) -> Bool in
            return (input == "+") || (input == "-") || (input == "*") || (input == "/")
        }
        separatedOperators.forEach { separatedCharactorOperator in
            Operator.allCases.forEach { symbolOperator in
                if symbolOperator.rawValue == separatedCharactorOperator {
                    let convertedToCaseOperators: Operator = symbolOperator
                    formula.operators.enqueue(element: convertedToCaseOperators)
                }
            }
        }
        return formula
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        var operatorSet: CharacterSet = CharacterSet()
        Operator.allCases.forEach{
            operatorSet.insert(charactersIn: String($0.rawValue))
        }
        let result: [String] = input.components(separatedBy: operatorSet)
        return result
    }
}
