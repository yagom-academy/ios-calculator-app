//
//  String+Extension.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/06/06.
//

extension String {
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }
}
