//
//  ExpressionParser.swift
//  Calculator
//
//  Created by idinaloq on 2023/06/02.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        
        return split(separator: target).map { String($0) }
    }
}

enum Expressionparser {
//    static func parse(from input: String) -> Formula {
//
        //1. operand 반환 ( split 사용)
        //2. operator반환 ( component 사용)
//    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]

        //1. 얘는 숫자와 계산식을 각각 나눠서 배열에 저장해서 리턴해야됨
        
        Operator.allCases.forEach { operatorCase in
            result = result.flatMap { $0.components(separatedBy: String(operatorCase.rawValue)) }
        }
        return result
        
    }
}
