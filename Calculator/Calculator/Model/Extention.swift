//
//  Extention.swift
//  Calculator
//
//  Created by Rowan on 2023/01/27.
//

extension Int: CalculateItem {}

extension Double: CalculateItem {}

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
