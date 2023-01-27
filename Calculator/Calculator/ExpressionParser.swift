//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 송종환 on 2023/01/26.
//

import Foundation

var str: String = "1+2-4+23*2"

enum ExpressionParser: Formula {
    
    //componentsByOperates로 변환된값이 들어오면 Formula로 분류
    static func parse(from input: String) -> Formula {
        
        var operatorArray: [Operator] = []
        var operandArray: [Character] = []
        
        componentsByOperators(from: input)
    }
    
    //담아오는 String을 오퍼레이터 기준으로 분류하는 매서드
    static private func componentsByOperators(from target: String) -> [String] {
        
        var resultNumber: [String] = []
        resultNumber.append(target)

        for number in Operator.allCases {
            var curruentNumber: [String] = []
            
            resultNumber.forEach {
                curruentNumber += $0.split(someChracter: number.rawValue)
            }
            
            resultNumber = curruentNumber
        }
        return resultNumber
    }
}

