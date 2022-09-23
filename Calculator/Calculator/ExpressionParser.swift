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
        let formula = Formula()
        formula.operators.
        return Formula()
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let operandsArray = input.components(separatedBy: ["+", "-", "*", "/"])
        return operandsArray
    }
}
