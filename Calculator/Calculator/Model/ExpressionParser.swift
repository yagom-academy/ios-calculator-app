//  ExpressionParser.swift
//  Calculator
//  Created by LJ on 2022/09/23.

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var fomulaTest: Formula = Formula()
        let separatedInputOperands: Array<String> = input.components(separatedBy: ["+","-","*","/"])
        let doubleNumbersOperands = separatedInputOperands.map({ (number: String) -> Double in
            return Double(number) ?? 99.999
        })
        return fomulaTest
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        var separatedInputOperator: Array<Character> = []
        var separatedRawInput: Array<Character> = []
        
        for i in input.indices {
            separatedRawInput.append(input[i])
        }
        separatedInputOperator = input.filter{ (separatedRawInput: Character ) -> Bool in
            return (separatedRawInput == "+")
                || (separatedRawInput == "-")
                || (separatedRawInput == "*")
                || (separatedRawInput == "/")
        }
        let convertedStringOperator = separatedInputOperator.map({
            (characterOperator: Character) -> String in
            return String(characterOperator)
        })
        return convertedStringOperator
    }
}


