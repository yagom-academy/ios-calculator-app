//
//  String+Extension.swift
//  Calculator
//
//  Created by Baem on 2022/09/24.
//

extension String {
    func split(with target: Character) -> [String] {
        let separatedWord = self.map { $0 }
        var result: [String] = []
        var bundledWord = ""
        
        for element in separatedWord {
            if element != target {
                bundledWord += String(element)
            } else {
                result.append(bundledWord)
                bundledWord = ""
            }
        }
        result.append(bundledWord)
        
        return result
    }
}
