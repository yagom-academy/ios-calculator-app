//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/12.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) {
        componentByOperators(from: input)
    }
    
    private static func componentByOperators(from input: String) -> [String] {
        return Operator.allCases.map{ $0.rawValue }.reduce([input]) { (result,`operator`) in
            result.flatMap { $0.split(with: `operator` )} }
    }
}
