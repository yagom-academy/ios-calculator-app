//
//  Extension.swift
//  Calculator
//
//  Created by mireu on 2023/10/06.
//
extension String: CalculateItem { }

extension Double: CalculateItem {
    
}

extension String {
    func split(with target: Character) -> [String] {
        return split(separator: target).map{ String($0) }
    }
}
