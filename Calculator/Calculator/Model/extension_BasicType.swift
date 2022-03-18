//
//  model.swift
//  Calculator
//
//  Created by Red on 2022/03/15.
//

import Foundation

extension Double: CalculateItem {
}

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
