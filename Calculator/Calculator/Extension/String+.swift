//
//  String+.swift
//  Calculator
//
//  Created by jyubong on 10/12/23.
//

extension String {
    func split(with target: Character) -> [String] {
        let splitedString = split(separator: target).compactMap { String($0) }
        
        return splitedString
    }
}
