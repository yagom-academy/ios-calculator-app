//
//  String+.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/24.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
