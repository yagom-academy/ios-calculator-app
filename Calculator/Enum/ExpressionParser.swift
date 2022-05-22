//
//  ExpressionParser.swift
//  Calculator
//
//  Created by unchain123 on 2022/05/22.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let results = self.split(separator: target)
        let result = results.map { String($0) }
        
        return  result
    }
}
