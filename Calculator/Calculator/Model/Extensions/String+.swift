//
//  String+.swift
//  Calculator
//
//  Created by Serena on 2023/05/31.
//

extension String {
    func split(with target: Character) -> [String] {
        let targetArray = self.split(separator: target).map(String.init)
        
        return targetArray
    }
}
