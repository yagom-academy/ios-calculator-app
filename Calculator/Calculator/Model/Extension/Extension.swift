//
//  extension.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/17.
//

import Foundation

extension String: CalculateItem {
    func split(with target: Character) -> [String] {
        self.split(separator: target).map { character in
            String(character)
        }
    }
}

extension Double: CalculateItem {
    // Empty
}
