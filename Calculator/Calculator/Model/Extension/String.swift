//
//  String.swift
//  Calculator
//
//  Created by Min Hyun on 2023/06/02.
//

extension String {
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }
}
