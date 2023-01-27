//
//  extensions.swift
//  Calculator
//
//  Created by 혜모리 on 2023/01/27.
//

extension String: CalculateItem {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}

extension Double: CalculateItem {
    
}
