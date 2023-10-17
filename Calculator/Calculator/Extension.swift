//
//  Extension.swift
//  Calculator
//
//  Created by Hisop on 2023/10/13.
//

extension Double: CalculateItem { }

extension String {
    func split(with target: Character) -> [String] {
        return split(separator: target).map { String($0) }
    }
}
