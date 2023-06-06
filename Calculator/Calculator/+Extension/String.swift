//
//  String.swift
//  Calculator
//
//  Created by 박종화 on 2023/06/02.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).compactMap{String($0)}
    }
}

