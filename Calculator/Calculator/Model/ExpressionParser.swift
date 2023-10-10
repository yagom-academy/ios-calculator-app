//
//  ExpressionParser.swift
//  Calculator
//
//  Created by jyubong on 10/10/23.
//

enum ExpressionParser {
    
}

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map{ String($0) }
    }
}
