//
//  String.swift
//  Calculator
//
//  Created by NAMU on 2022/05/19.
//

extension String {
    func split(with target: Character) -> [String] {
        let stringArray = self.split(separator: target).map { String($0) }
        return stringArray
    }
}
