//
//  ExpressionParser.swift
//  Calculator
//
//  Created by mint on 2023/06/02.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        
        return formula
    } //여기서 formula 만들어서 반환
    
    private static func componentsByOperators(from input: String) -> [String] {
        return []
    }//private가 붙어서 이 enum 안에서만 사용할 수 있음. 즉 parse에서 호출해 사용.
}
