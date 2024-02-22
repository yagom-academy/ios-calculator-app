//
//  Extensions.swift
//  Calculator
//
//  Created by Yejin Hong on 2024/02/14.
//

extension Double: CalculateItem { }

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
