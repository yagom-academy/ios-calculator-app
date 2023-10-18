//
//  String+.swift
//  Calculator
//
//  Created by jyubong on 10/12/23.
//

extension String {
    func split(with target: Character) -> [String] {
        split(separator: target).compactMap { String($0) }
    }
    
    mutating func appendFirst(_ text: String) {
        self = text + self
    }
}
