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
        var convertArray: Array<String> = []
        convertArray = componentsByOperators(from: "10.0+20.0*3.0/2.0+3.0+11.0-2.0*9.0")
        
        for i in doubleNumbersOperands {
            fomulaTest.operands.enqueue(element: i)
        }
        for j in convertArray {
            let value: Operator = Operator.init(rawValue: j)
            fomulaTest.operators.enqueue(element: value)
        }
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


