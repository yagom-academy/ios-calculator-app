//
//  String+.swift
//  Calculator
//
//  Created by 비모 on 2023/06/05.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
