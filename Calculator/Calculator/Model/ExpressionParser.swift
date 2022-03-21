//
//  ExpressionParser.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/17.
//

import Foundation

enum ExpressionParser {
    
//    static func parse(from input: String) {
//        let splitSentence = componentsByOperators(from: input)
//            
//        if let aaa = Double($0), let vvv = Operator(rawValue: Character($0)) {
//        
//        }
//            Formula(operands: aaa, operators: vvv)
//    }
    
    static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
