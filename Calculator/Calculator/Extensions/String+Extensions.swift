//
//  String+Extensions.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/19.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
