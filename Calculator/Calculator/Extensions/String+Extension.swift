//
//  String+Extension.swift
//  Calculator
//
//  Created by yeha on 2021/11/15.
//

extension String {
    func split(with target: Character) -> [String] {
        return components(separatedBy: target.description)
    }
}
