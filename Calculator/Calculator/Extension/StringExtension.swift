//
//  StringExtension.swift
//  Calculator
//
//  Created by Hamo on 2022/09/27.
//

extension String {
    func split(with target: Character) -> [String] {
        var result: [String] = []
        var nonTargets: [String] = []
        var isNegative: Bool = true
        
        self.forEach { character in
            if character == target && !isNegative {
                isNegative = true
                result.append(nonTargets.joined(separator: ""))
                result.append(String(character))
                nonTargets = []
            } else {
                isNegative = false
                nonTargets.append(String(character))
            }
        }
        
        result.append(nonTargets.joined(separator: ""))
        return result.filter { $0 != "" }
    }
}
