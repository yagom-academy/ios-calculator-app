//
//  String+.swift
//  Calculator
//
//  Created by JIWOONG on 2024/02/22.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
