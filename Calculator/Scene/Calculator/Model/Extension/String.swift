//
//  String.swift
//  Calculator
//
//  Created by 이은찬 on 2022/05/19.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).compactMap{ String($0) }
    }
}
