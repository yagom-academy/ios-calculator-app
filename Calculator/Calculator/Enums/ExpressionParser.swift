//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/22.
//
import Foundation

enum ExpressionParser {
    static func parser(from input: String) -> Formula {
        let operands = ExpressionParser.componentsByOperators(from: input).compactMap { Double($0) }
        let operators = input.compactMap { Operator(rawValue: $0) }
        
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Operator>()
        operandsQueue.push(operands)
        operatorsQueue.push(operators)        
        
        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var operators: CharacterSet = CharacterSet()

        Operator.allCases.forEach {
            operators.insert(charactersIn: String($0.rawValue))
        }

        return input.components(separatedBy: operators).map { $0.replacingOccurrences(of: "−", with: "-") }
    }
}
