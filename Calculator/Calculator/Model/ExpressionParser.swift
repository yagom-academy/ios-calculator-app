//
//  ExpressionParser.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/24.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Operator>()
        
        var validInput = input
        
        guard let firstElement = input.first else {
            return Formula(operands: operandsQueue, operators: operatorsQueue)
        }
        
        if !firstElement.isNumber {
            validInput = "0" + validInput
        }
        
        let operands = componentsByOperators(from: validInput)
        operands.forEach {
            guard let number = Double($0) else { return }
            operandsQueue.enqueue(item: number)
        }

        let operators = Operator.allCases.map { $0.rawValue }
        let splitInput = validInput.split(with: " ")
        var lastElement: String = " "
        var operatorQueue: [Character] = []
        
        
        
        operatorQueue.forEach {
            guard let operatorSign = Operator(rawValue: $0) else { return }
            operatorsQueue.enqueue(item: operatorSign)
        }

        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        let operators = Operator.allCases.map { $0.rawValue }
        
        for oper in operators {
            result = result.flatMap {$0.split(with: oper) }
        }
        
        print(result)
        
        return result
    }
}
