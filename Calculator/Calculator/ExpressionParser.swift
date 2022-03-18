//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이시원 on 2022/03/18.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}

enum ExpressionParser {
    
    private static func compomnentsByOperators(from input: String) -> [String] {
        var value: [String] = []
        value.append(input)
        let operatorList: [Character] = ["+", "-", "÷", "×"]
        for i in operatorList {
            value = value.flatMap { $0.split(with: i) }
        }
        
        return value
    }
    
}
