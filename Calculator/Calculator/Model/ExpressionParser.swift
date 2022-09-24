//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Jiyoung Lee on 2022/09/24.
//

import Foundation

enum ExpressionParser {
    // 입력한 수식 전체를 받아서 Formula로 리턴해줌
    // Formula는 피연산자 큐랑 연산자 큐로 구성되어 있음
    // 수식 전체를 -> 피연산자 / 연산자로 구분해서 Formula에 넣어준다
    static func parse(from input: String) -> Formula {
        var formula: Formula = Formula()
        
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: [String] = []
        
        return result
    }
}
