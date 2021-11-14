//
//  StringExtension.swift
//  Calculator
//
//  Created by 양호준 on 2021/11/14.
//

extension String {
    func split(with target: Character) -> [String] {
        self.components(separatedBy: String(target))
    }
}
