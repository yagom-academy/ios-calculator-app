//
//  Double + String.swift
//  Calculator
//
//  Created by 서현웅 on 2022/09/22.
//

import Foundation

extension Double: CalculateItem {
}

extension String {
    func split(with target: Character) -> [String] {
        let result = split(separator: target).map { (value) -> String in
            return String(value) }
        return result
    }
}
