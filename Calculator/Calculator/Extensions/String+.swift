//
//  String+.swift
//  Calculator
//
//  Created by Minsup on 2023/05/31.
//

extension String {
    func split(with target: Character) -> [String] {
        self.components(separatedBy: String(target))
    }
}
