//
//  ExpressionParser.swift
//  Calculator

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandsQueue = componentsByOperators(from: input).compactMap{
            Double($0)
        }
        let operatorsQueue: [Operator] = input.compactMap{
            Operator(rawValue: $0)
        }
        let formula = Formula(operands: CalculatorItemQueue(operandsQueue),
                              operators: CalculatorItemQueue(operatorsQueue))
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var separators: CharacterSet = CharacterSet()
        
        Operator.allCases.forEach { `operator` in
            separators.insert(charactersIn: `operator`.description)
        }
        
        let result = input.components(separatedBy: separators)
        
        return result
    }
}
