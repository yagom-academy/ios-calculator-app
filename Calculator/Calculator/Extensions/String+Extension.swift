//
//  String+Extension.swift
//  Calculator
//
//  Created by jin on 9/22/22.
//

extension String {
    
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
