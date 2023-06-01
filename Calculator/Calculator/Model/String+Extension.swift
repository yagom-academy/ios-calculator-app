//
//  String+Extension.swift
//  Calculator
//
//  Created by Erick on 2023/06/01.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
