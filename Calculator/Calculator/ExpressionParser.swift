//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Mangdi on 2022/09/22.
//

import Foundation

enum ExpressionParser {
    //파서(문장의 구조 분석·오류 점검 프로그램).
    static func parse(from input: String) -> Formula {
        let numberArray = componentsByOperators(from: input).map {  Double($0) }
        var formula = Formula()
        
        for num in numberArray {
            formula.operands?.enqueue(num ?? 0)
        }
        
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let operandsArray = input.components(separatedBy: ["+", "-", "*", "/"])
        return operandsArray
    }
}
