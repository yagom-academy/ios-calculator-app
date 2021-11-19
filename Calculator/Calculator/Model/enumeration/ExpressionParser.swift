//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 예거 on 2021/11/16.
//

import Foundation
import UIKit

enum ExpressionParser {
    static let whiteSpace: Character = " "
    static let emptyString: String = ""
    static let defaultOperandLabel: String = "0"
    
    static func parse(from input: String) -> Formula {
        let splitedInput = input.split(with: whiteSpace)
        let filteredOperatorRawValues = componentsByOperators(from: input)
        let operands = CalculatorItemQueue(queue: splitedInput.compactMap { operand in
            return Double(operand) })
        let operators = CalculatorItemQueue(queue: filteredOperatorRawValues.compactMap { operatorRawValue in
            return Operator(rawValue: operatorRawValue)
        })
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let splitedInput = input.split(with: whiteSpace)
        
        return splitedInput.filter { `operator` in
            return Operator.operatorRawValues.contains(`operator`)
        }
    }
}
