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
        let defaultOperators = Set<Character>(Operator.allCases.map({ (each: Operator) -> Character in
            return each.rawValue
        }))
        
        let operators = input
            .filter({ (each: Character) -> Bool in
                return defaultOperators.contains(each)
            })
            .map({ (each: Character) -> String in
                return String(each)
            })
        
        
        let operands = try input
            .map({ (each: Character) -> String in
                return defaultOperators.contains(each) ? " " : String(each)
            })
            .joined().components(separatedBy: " ")
            .map { (each: String) -> String in
                guard let _ = Double(each) else {
                    throw CalculatorError.unknownOperator
                }
                return each
            }
        
        return operands + operators
    }
}

