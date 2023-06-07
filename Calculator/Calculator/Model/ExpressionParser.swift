//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Whales on 2023/06/07.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
        var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
        
        let components = componentsByOperators(from: input)
        let operatorsArray = components.filter { ["+", "-", "/", "*"].contains($0) }
        let operandsArray = components.filter { !["+", "-", "/", "*"].contains($0) }
        
        for element in operatorsArray {
            let changeToCharacter = Character(element)
            
            guard let changeToOperator = Operator(rawValue: changeToCharacter) else {
                throw CalculatorError.invalidOperator
            }
            
            operators.enqueue(changeToOperator)
        }
        
        for element in operandsArray {
            guard let element = Double(element) else {
                throw CalculatorError.invalidNumber
            }
            
            operands.enqueue(element)
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
