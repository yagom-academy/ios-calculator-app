//
//  String+split.swift
//  Calculator
//
//  Created by Hemg on 2023/06/04.
//

extension String {
    func split(with target: Character) -> [String] {
        return split(separator: target).map {String($0)}
    }
}
