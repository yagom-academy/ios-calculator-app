//
//  Extension.swift
//  Calculator
//
//  Created by Yetti on 2023/06/09.
//

extension Int: CalculateItem {}

extension Double: CalculateItem {}

extension String: CalculateItem {}
extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
