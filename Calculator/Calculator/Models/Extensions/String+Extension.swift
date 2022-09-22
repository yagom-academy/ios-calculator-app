//
//  String+Extension.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/22.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
