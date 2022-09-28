//
//  String+Extension.swift
//  Calculator
//
//  Created by Baem on 2022/09/24.
//

extension String {
    func split(with target: Character) -> [String] {
        var result = self.components(separatedBy: String(target))
        
        if result.first == "" {
            result.removeFirst()
        }
        if result.last == "" {
            result.removeLast()
        }
        
        return result
    }
}
