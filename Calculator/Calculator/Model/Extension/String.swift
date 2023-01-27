//
//  String.swift
//  Calculator
//
//  Created by kaki on 2023/01/27.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
