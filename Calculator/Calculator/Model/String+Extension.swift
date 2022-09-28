//
//  String+Extension.swift
//  Calculator
//
//  Created by Baem on 2022/09/24.
//

extension String {
    func split(with target: Character) -> [String] {
        var result: [String] = []
        var bundledWord = ""
        
        self.forEach {
            if $0 != target {
                bundledWord += String($0)
            } else {
                result.append(bundledWord)
                bundledWord = ""
            }
        }
        
        result.append(bundledWord)
        
        return result
    }
}
