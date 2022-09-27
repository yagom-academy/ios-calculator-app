//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Mangdi on 2022/09/22.
//

import Foundation

enum ExpressionParser {
    // 연산자배열 추가하기
    static func parse(from input: String) -> Formula {
        let numberArray = componentsByOperators(from: input).compactMap { Double($0) }
        let operands = CalculatorItemQueue<Double>()
        var formula = Formula(operands: operands)
        
        for num in numberArray {
            formula.operands?.enqueue(num)
        }
        
        return formula
    }
    
    //이곳 체크하기
    static private func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.reduce("") { $0 + String($1.rawValue) }
        let separators = CharacterSet(charactersIn: operators)
        let operandsArray = input.components(separatedBy: separators)
        return operandsArray
    }
}
