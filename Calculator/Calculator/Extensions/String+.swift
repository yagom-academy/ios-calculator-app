//
//  String+.swift
//  Calculator
//
//  Created by 이경민 on 2022/09/22.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.filter { $0 != target }.compactMap { String($0) }
    }
}
