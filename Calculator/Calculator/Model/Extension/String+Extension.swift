//
//  StringExtension.swift
//  Calculator
//
//  Created by 써니쿠키 on 2022/09/22.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
