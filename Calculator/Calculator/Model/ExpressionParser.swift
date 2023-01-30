//  Calculator - ExpressionParser.swift
//  created by vetto on 2023/01/27
import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandsArray = componentsByOperators(from: input).compactMap { Double($0) }
        let operatorsArray = input.compactMap{ Operator(rawValue: $0) }

        let operandQueue = CalculatorItemQueue(with: operandsArray)
        let operatorQueue = CalculatorItemQueue(with: operatorsArray)
        
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators = String(Operator.allCases.map{ $0.rawValue })
        let operatorSet = CharacterSet(charactersIn: operators)
        
        return input.components(separatedBy: operatorSet).filter{ $0 != "" }
    }
}
