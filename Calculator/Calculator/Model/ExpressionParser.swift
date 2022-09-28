//
//  ExpressionParser.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/24.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operandsQueue = parseOperands(from: input)
        let operatorsQueue = parseOperators(from: input)

        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
 
    private static func parseOperands(from input: String) -> CalculatorItemQueue<Double> {
        var operandsQueue = CalculatorItemQueue<Double>()
        
        let operands = componentsByOperators(from: input)
            .compactMap(Double.init)
        operands.forEach { operandsQueue.enqueue(item: $0) }
        
        return operandsQueue
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var splitInput: [String] = [input]
        
        for operatorSign in Operator.allCases {
            splitInput = splitInput.flatMap { $0.split(with: operatorSign.rawValue) }
        }
        
        var numbers: [String] = []
        
        for i in 0..<splitInput.count {
            if splitInput[i] == "" { continue }
            if i > 0, splitInput[i - 1] == "", splitInput[i].isNumber {
                let negative: String = "-" + splitInput[i]
                numbers.append(negative)
            } else {
                numbers.append(splitInput[i])
            }
        }
        
        return numbers
    }
    
    private static func parseOperators(from input: String) -> CalculatorItemQueue<Operator> {
        var operatorsQueue = CalculatorItemQueue<Operator>()

        var removedNegativeSignAtFront = input
        if input.first == "-" {
            removedNegativeSignAtFront.removeFirst()
        }
        
        let operators = Operator.allCases.map { $0.rawValue }
        for operatorSign in operators {
            removedNegativeSignAtFront = removedNegativeSignAtFront
                .replacingOccurrences(of: "\(operatorSign)-", with: "\(operatorSign)")
        }
        
        removedNegativeSignAtFront.forEach {
            guard let operatorSign = Operator(rawValue: $0) else { return }
            operatorsQueue.enqueue(item: operatorSign)
        }
        
        return operatorsQueue
    }
}
