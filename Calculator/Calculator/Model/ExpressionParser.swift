//  Calculator - ExpressionParser.swift
//  created by vetto on 2023/01/27
import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        let operandsArray = componentsByOperators(from: input).compactMap { Double($0) }
        let operatorsArray = input.compactMap{ Operator(rawValue: $0) }
        
        for operands in operandsArray {
            operandsQueue.enqueue(operands)
        }
        
        for operators in operatorsArray {
            operatorQueue.enqueue(operators)
        }
        
        return Formula(operands: operandsQueue, operators: operatorQueue)
    }
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ").compactMap { String(Double($0) ?? 0)}
    }
}
