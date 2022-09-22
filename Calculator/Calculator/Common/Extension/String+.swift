//
//  String+.swift
//  Calculator
//
//  Created by Kyo on 2022/09/22.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
