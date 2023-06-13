//
//  String+.swift
//  Calculator
//
//  Created by karen, Mary.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
