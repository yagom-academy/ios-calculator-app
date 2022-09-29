//
//  String+Extension.swift
//  Calculator
//
//  Created by Baem on 2022/09/24.
//

extension String {
    func split(with target: Character) -> [String] {
        self.trimmingCharacters(in: [" "]).components(separatedBy: String(target))
    }
}
