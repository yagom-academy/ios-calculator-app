//
//  ExpressionParser.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/24.
//

import Foundation

extension String {
    var isNumber: Bool {
        return Double(self) != nil ? true : false
    }
}

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Operator>()
        
        let operands = componentsByOperators(from: input)
        operands.forEach {
            guard let operand = Double($0) else { return }
            operandsQueue.enqueue(item: operand)
        }

        let operators = Operator.allCases.map { $0.rawValue }
        var operatorQueue: [Character] = []
        
        operatorQueue.forEach {
            guard let operatorSign = Operator(rawValue: $0) else { return }
            operatorsQueue.enqueue(item: operatorSign)
        }

        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var splitInput: [String] = [input]
        
        let operators = Operator.allCases.map { $0.rawValue }
        for operatorSign in operators {
            splitInput = splitInput.flatMap { $0.split(with: operatorSign) }
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
}
