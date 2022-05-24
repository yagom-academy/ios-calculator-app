//
//  String.swift
//  Calculator
//
//  Created by 전민수 on 2022/05/19.
//
extension String {
    func split(with target: Character) -> [String] {
        self.split(separator: target).map { String($0) }
    }
}
