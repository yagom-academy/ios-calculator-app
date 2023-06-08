//
//  StringExtension.swift
//  Calculator
//
//  Created by idinaloq on 2023/06/07.
//

extension String {
    func split(with target: Character) -> [String] {
        return split(separator: target).map { String($0) }
    }
}
