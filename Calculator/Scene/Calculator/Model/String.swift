//
//  String.swift
//  Calculator
//
//  Created by 본프, 수꿍 on 2022/05/20.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).compactMap{ String($0) }
    }
}
