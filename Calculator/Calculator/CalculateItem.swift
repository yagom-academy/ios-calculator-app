//
//  CalculatorItem.swift
//  Calculator
//
//  Created by Whales on 2023/05/31.
//

protocol CalculateItem { }

extension Double: CalculateItem { }

extension String: CalculateItem {
    func split(with target: Character) -> [String] {
        self.components(separatedBy: String(target))
    }
}
