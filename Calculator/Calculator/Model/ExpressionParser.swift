//
//   ExpressionParser.swift
//  Calculator
//
//  Created by 임지성 on 2021/11/11.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = componentsByOperators(from: input)
                        .compactMap{ Double($0) }
        
        let operators = input.filter{ inputSlice in
            Double(inputSlice.description) == nil
        }.compactMap{ Operator(rawValue: $0) }
        
        return Formula(operators: CalculatorItemQueue(operators), operands: CalculatorItemQueue(operands))
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var inputArray = [input]
        var tempArray: [String] = []
        Operator.allCases.forEach { `operator` in
            for input in inputArray {
                tempArray += input.split(with: `operator`.rawValue)
            }
            inputArray = tempArray
            tempArray.removeAll()
        }
        return inputArray
    }
}
