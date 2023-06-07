//
//  String+Extension.swift
//  Calculator
//
//  Created by Erick on 2023/06/01.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
