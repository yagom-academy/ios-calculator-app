//
//  String+.swift
//  Calculator
//
//  Created by EtialMoon on 2023/05/30.
//

extension String {
    func split(with target: Character) -> [String] {
        var result: [String] = []
        
        self.split(separator: target).forEach { element in
            result.append(String(element))
        }
        
        return result
    }
}
