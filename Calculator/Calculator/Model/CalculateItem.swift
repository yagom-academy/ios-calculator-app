//
//  CalculateItem.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/29.
//

protocol CalculateItem {}

extension Double: CalculateItem {}
extension String {
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }
}
