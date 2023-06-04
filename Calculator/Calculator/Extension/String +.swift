//
//  String +.swift
//  Calculator
//
//  Created by Hyungmin Lee on 2023/06/02.
//
extension String {
    func split(with target: Character) -> [String] {
        return split(separator: target, maxSplits: 1).compactMap { String($0) }
    }
}
