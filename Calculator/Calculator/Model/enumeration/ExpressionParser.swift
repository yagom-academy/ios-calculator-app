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
        let operands = CalculatorItemQueue(queue: splitedInput.compactMap { operand in
            Double(operand)
        })
        let filteredOperatorSymbols = componentsByOperators(from: input)
        let operators = CalculatorItemQueue(queue: filteredOperatorSymbols.compactMap { `operator` in
            Operator(symbol: `operator`)
        })
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let splitedInput = input.split(with: whiteSpace)
        
        return splitedInput.filter { eachString in
            Operator.symbols.contains(eachString)
        }
    }
}
