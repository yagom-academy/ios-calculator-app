//
//  extension.swift
//  Calculator
//
//  Created by mint on 2023/06/02.
//

import Foundation

extension Double: CalculateItem { }

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
