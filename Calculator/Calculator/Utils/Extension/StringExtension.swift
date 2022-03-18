//
//  StringExtension.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/18.
//

extension String {
    func split(with target: Character) -> [String] {
        return split(separator: target).map{ String($0) }
    }
}
