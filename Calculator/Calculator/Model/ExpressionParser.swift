//  ExpressionParser.swift
//  Calculator
//  Created by LJ on 2022/09/23.

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> [Double] {
        let separatedInputOperands: Array<String> = input.components(separatedBy: ["+","-","*","/"])
        let doubleNumbersOperands = separatedInputOperands.map({ (number: String) -> Double in
            return Double(number) ?? 99.999
        })
        print("1 doubleNumbersOperands 숫자뽑은거 : \(doubleNumbersOperands)")
        return doubleNumbersOperands
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        return [""]
    }
}


