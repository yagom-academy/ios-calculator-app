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
        
        parsedInput[0]
            .split(with: " ")
            .compactMap { Double($0) }
            .forEach {
                operands.enqueue($0)
            }
        
        parsedInput[1]
            .split(with: " ")
            .compactMap { Operator(rawValue: Character($0)) }
            .forEach {
                operators.enqueue($0)
            }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) throws -> [String] {
        var operands: [String] = []
        var operators: [String] = []
        
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
                operands.append(temporaryOperand)
                continue
            }
            
            // 피연산자에 해당된다면
            if Double(convertedCharacter) != nil || convertedCharacter == "-" {
                temporaryOperand += convertedCharacter
                continue
            }
            
            // 연산자에 해당된다면
            if defaultOperators.contains(convertedCharacter) {
                operands.append(temporaryOperand)
                operators.append(convertedCharacter)
                temporaryOperand = ""
                continue
            }
            
            throw CalculatorError.unknownOperator
        }
        
        return [operands.joined(separator: " "), operators.joined(separator: " ")]
    }
}

