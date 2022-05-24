//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 허건 on 2022/05/19.
//
import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        let splitElements = componentsByOperators(from: input)
        var operandQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        splitElements.compactMap { (element: String) -> Double? in
            let alterElement: Double? = Double(element)
            return alterElement
        }.forEach { (number: Double) in
            operandQueue.enqueue(number)
        }

        splitElements.compactMap { (element: String) -> Character in
            let alterElement: Character = Character(element)
            return alterElement
        }.forEach {
            if let operatorElements = Operator(rawValue: $0) {
                operatorQueue.enqueue(operatorElements)
            }
        }
        
        let parseDataResult = Formula(operands: operandQueue, operators: operatorQueue)
        return parseDataResult
    }

    static func componentsByOperators(from input: String) -> [String] {
        let splitInput = input.split(with: " ")
        return splitInput
    }
}
