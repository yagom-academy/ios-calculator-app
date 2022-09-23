//
//  ExpressionParser.swift
//  Calculator
//
//  Created by junho lee on 2022/09/23.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var result: Formula = Formula()
        
        var filteredInput: String
        filteredInput = input.replacingOccurrences(of: "+-", with: "+")
        filteredInput = filteredInput.replacingOccurrences(of: "--", with: "-")
        filteredInput = filteredInput.replacingOccurrences(of: "*-", with: "×")
        filteredInput = filteredInput.replacingOccurrences(of: "÷-", with: "÷")
        filteredInput = filteredInput.filter("+-×÷".contains)
        for operatorRawValue in filteredInput {
            if let operatorToEnqueue: Operator = Operator.init(rawValue: operatorRawValue) {
                result.operators.enqueue(operatorToEnqueue)
            }
        }
        
        let operands = componentsByOperators(from: input)
        var nextOperandisMinus: Bool = false
        for operand in operands {
            if let operand: Double = Double(operand) {
                let operandToEnqueue: Double = nextOperandisMinus ? -operand : operand
                result.operands.enqueue(operandToEnqueue)
                nextOperandisMinus = false
            } else if operand == "" {
                nextOperandisMinus = true
            }
        }
        return result
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: Array<String> = [input]
        for operatorCase in Operator.allCases {
            result = result.flatMap { $0.split(with: operatorCase.rawValue) }
        }
        return result
    }
}
