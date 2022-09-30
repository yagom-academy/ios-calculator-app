//  String.swift
//  Calculator
//  Created by LJ on 2022/09/24.

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let result: [String] = self.components(separatedBy: String(target))
        return result
    }
}
