//
//  Extension.swift
//  Calculator
//
//  Created by 무리 on 2023/01/30.
//

extension String {
    func split(with target: Character) -> [String] {
        let splitedArray = components(separatedBy: String(target))

        return splitedArray
    }
}
