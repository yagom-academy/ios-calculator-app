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
        
        let splitDoubleResult = splitElements.compactMap { (element: String) -> Double? in
            let alterElement: Double? = Double(element)
            return alterElement
        }
        
        let splitCharacterResult = splitElements.filter { value in
            return Double(value) == nil
        }
        
        splitDoubleResult.forEach { (number: Double) in
            operandQueue.enqueue(number)
        }
        
        splitCharacterResult.forEach { oper in
            let opert = Character(oper)
            operatorQueue.enqueue(Operator(rawValue: opert)!)
        }
        
        let parseDataResult = Formula(operands: operandQueue, operators: operatorQueue)
        return parseDataResult
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        let splitInput = input.split(with: " ")
        return splitInput
    }
}
