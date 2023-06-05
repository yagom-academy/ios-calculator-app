//
//  String+.swift
//  Calculator
//
//  Created by Serena on 2023/05/31.
//

extension String: CalculateItem {
    func split(with target: Character) -> [String] {
        var targetArray = self.split(separator: target).map {(value) -> String in
            return String(value)
        }
        
        return targetArray
    }
}
