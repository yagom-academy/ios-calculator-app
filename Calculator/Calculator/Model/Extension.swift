//
//  Extension.swift
//  Calculator
//
//  Created by Kiseok on 2023/10/03.
//

extension Int: CalculateItem { }

extension Double: CalculateItem { }

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
