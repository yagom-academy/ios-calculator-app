//
//  String+.swift
//  Calculator
//
//  Created by EtialMoon on 2023/05/30.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
