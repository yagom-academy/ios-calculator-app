//
//  String+.swift
//  Calculator
//
//  Created by Kiseok on 2023/10/12.
//

extension String {
    func split(with target: Character) -> [String] {
        let input = self.components(separatedBy: .whitespaces).joined()
        return input.split(separator: target).map { String($0) }
    }
}
