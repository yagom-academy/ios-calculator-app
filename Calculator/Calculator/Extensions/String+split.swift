//
//  String+split.swift
//  Calculator
//
//  Created by junho lee on 2022/09/21.
//

extension String {
    func split(with target: Character) -> [String] {
        self.trimmingCharacters(in: [" "]).components(separatedBy: String(target))
    }
}
