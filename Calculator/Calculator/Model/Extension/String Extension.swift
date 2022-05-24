//
//  Extension.swift
//  Calculator
//
//  Created by Kiwi on 2022/05/19.
//

extension String {
    func split(with target: Character) -> [String] {
        split(separator: target).map{ String($0) }
    }
}
