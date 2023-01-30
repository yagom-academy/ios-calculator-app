//
//  String+.swift
//  Calculator
//
//  Created by Jinah Park on 2023/01/30.
//

extension String {
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }
}
