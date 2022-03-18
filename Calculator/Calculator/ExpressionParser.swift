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
    
    private func compomnentsByOperators(from input: String) -> [String] {
        return []
    }
    
}
