//
//  ExpressionParser.swift
//  Calculator
//
//  Created by JeongTaek Han on 2021/11/14.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator>()
        
        let parsedInput = try componentsByOperators(from: input)
        
        parsedInput
            .compactMap({ (each: String) -> Double? in
                return Double(each)
            })
            .forEach({ (each: Double) -> Void in
                operands.enqueue(each)
            })
        
        parsedInput
            .filter({ (each: String) -> Bool in
                return Double(each) == nil
            })
            .compactMap({ (each: String) -> Operator? in
                return Operator(rawValue: Character(each))
            })
            .forEach({ (each: Operator) -> Void in
                operators.enqueue(each)
            })
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) throws -> [String] {
        var splittedMathExpression: [String] = []
        
        var defaultOperators: Set<String> = []
        Operator.allCases.forEach { (each: Operator) -> Void in
            defaultOperators.insert(String(each.rawValue))
        }
        
        var temporaryOperand = ""
        for eachCharacter in input {
            let convertedCharacter = String(eachCharacter)
            
            // 마지막이라면
            if input.last == eachCharacter {
                temporaryOperand += convertedCharacter
                splittedMathExpression.append(temporaryOperand)
                continue
            }
            
            // 피연산자에 해당된다면
            if Double(convertedCharacter) != nil || convertedCharacter == "-" {
                temporaryOperand += convertedCharacter
                continue
            }
            
            // 연산자에 해당된다면
            if defaultOperators.contains(convertedCharacter) {
                splittedMathExpression.append(temporaryOperand)
                splittedMathExpression.append(convertedCharacter)
                temporaryOperand = ""
                continue
            }
            
            throw CalculatorError.unknownOperator
        }
        
        return splittedMathExpression
    }
}

