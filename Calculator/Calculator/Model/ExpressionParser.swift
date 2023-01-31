//
//  ExpressionParser.swift
//  Calculator
//
//  Created by kimseongjun on 2023/01/27.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Operator>()
        
        input.compactMap { Operator(rawValue: $0) }.forEach {
            operatorsQueue.enqueue(item: $0)
        }
        
       componentsByOperators(from: input).map{
            $0.contains("⎼") ? $0.replacingOccurrences(of: "⎼", with: "-") : $0
        }.compactMap { Double($0) }.forEach { operand in
            operandsQueue.enqueue(item: operand)
        }
        
        var currentFomula = Formula()
        currentFomula.operands = operandsQueue
        currentFomula.operators = operatorsQueue
        return currentFomula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var numbers: [String] = [input]
        Operator.allCases.forEach { `operator` in
            numbers = numbers.map { $0.split(with: `operator`.rawValue) }.flatMap { $0 }
        }
        return numbers
    }
}

