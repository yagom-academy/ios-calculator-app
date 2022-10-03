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
        var isSign: Bool = true
        
        self.forEach { character in
            if character == target && !isSign {
                isSign = true
                result.append(nonTargets.joined(separator: ""))
                result.append(String(character))
                nonTargets = []
            } else {
                isSign = false
                nonTargets.append(String(character))
            }
        }
        
        result.append(nonTargets.joined(separator: ""))
        return result.filter { $0 != "" }
    }
}
