//
//  Protocol.swift
//  Calculator
//
//  Created by Rowan on 2023/01/25.
//

protocol CalculateItem {}

extension Int: CalculateItem {}
extension Double: CalculateItem {}

extension String {
    func split(with target: Character) -> [String] {
        let saparatedSubstring = self.split(separator: target)
        var result: [String] = []
        
        for member in saparatedSubstring {
            result.append(String(member))
        }
        
        return result
    }
}
