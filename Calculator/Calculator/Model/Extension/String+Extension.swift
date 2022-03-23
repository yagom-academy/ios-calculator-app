//
//  String+Extension.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/17.
//

extension String: CalculateItem {
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }
}
