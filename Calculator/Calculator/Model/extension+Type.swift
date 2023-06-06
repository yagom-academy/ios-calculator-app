//
//  extension+Type.swift
//  Calculator
//
//  Created by Hemg on 2023/06/04.
//

extension Double: CalculateItem {}

extension Int: CalculateItem {}

extension String: CalculateItem {
    func split(with target: Character) -> [String] {
        return split(separator: target).map {String($0)}
    }
}
