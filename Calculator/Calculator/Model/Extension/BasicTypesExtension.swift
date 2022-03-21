//
//  BasicTypesExtension.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/17.
//

import Foundation

extension String: CalculateItem {
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }
}

extension Double: CalculateItem {
    // Empty
}
