//
//  StringExtension.swift
//  Calculator
//
//  Created by Harry on 2023/02/06.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
