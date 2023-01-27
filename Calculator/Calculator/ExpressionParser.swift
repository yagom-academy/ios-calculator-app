//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 천승현 on 2023/01/27.
//

import Foundation

class ExpressionParser {
    func parse(from input: String) {
        
    }
    
    func componentnsByOperators(from input: String) -> [String] {
        var results: [String] = [input]
        
        Operator.allCases.forEach { oper in
            results = results.map { $0.split(with: oper.rawValue) }.flatMap { $0 }
        }
        return results
    }
}


