//
//  Extension.swift
//  Calculator
//
//  Created by Jinah Park on 2023/01/27.
//

import Foundation

extension Double: CalculateItem {}

extension String: CalculateItem {
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }
}
