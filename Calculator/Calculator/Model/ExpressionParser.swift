//
//  ExpressionParser.swift
//  Calculator
//
//  Created by yyss99, Serena on 2023/06/12.
//

import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
        var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
        
        let operandString = componentsByOperators(from: input)
        let operandParts = operandString.compactMap { Double($0) }
        let operatorChar = CharacterSet(charactersIn: operandString.joined())
        let operatorParts = input
            .components(separatedBy: operatorChar)
            .filter { $0 != "" }
            .compactMap{ Operator(rawValue: Character($0)) }
        
        for value in operandParts {
            operands.enqueue(value)
        }
        
        for value in operatorParts {
            operators.enqueue(value)
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let allOperatorRawValues = Operator.allCases.map { $0.rawValue }
        let componentStandard = CharacterSet(charactersIn: String(allOperatorRawValues))
        let componentParts = input.components(separatedBy: componentStandard)
        
        return componentParts
    }
}
