//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Mangdi on 2022/09/22.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let numberArray = componentsByOperators(from: input)
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator>()
        var formula = Formula(operands: operands, operators: operators)
        
        for number in numberArray {
            if let doubleNumber =
                Double(number.replacingOccurrences(
                    of: Literal.invertSign.value,
                    with: Literal.subtraction.value
                )) {
                formula.operands?.enqueue(doubleNumber)
            }
        }
        
        let allOperators = Operator.allCases.map { $0.rawValue }
        let operatorArray = input.filter { allOperators.contains($0) }.compactMap { Operator.init(rawValue: $0) }
        
        for someOperator in operatorArray {
            formula.operators?.enqueue(someOperator)
        }
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { String($0.rawValue) }.joined()
        let separators = CharacterSet(charactersIn: operators)
        let operandsArray = input.components(separatedBy: separators)
        return operandsArray
    }
}
