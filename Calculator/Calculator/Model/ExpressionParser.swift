//  Calculator - ExpressionParser.swift
//  created by vetto on 2023/01/27
import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operandQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        let operandsArray = componentsByOperators(from: input).compactMap { Double($0) }
        let operatorsArray = input.split(with: " ")
                                .filter { $0.count == 1 }
                                .compactMap { Operator(rawValue: Character($0)) }
        
        operandsArray.forEach { operandQueue.enqueue($0) }
        operatorsArray.forEach { operatorQueue.enqueue($0) }
        
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var operatorSet = CharacterSet()
        
        for `operator` in Operator.allCases {
            operatorSet.insert(charactersIn: String(`operator`.rawValue))
        }
        
        return input.components(separatedBy: operatorSet).filter{ $0 != "" }
    }
}
