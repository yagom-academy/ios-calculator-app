//
//  ExtensionUtilities.swift
//  Calculator
//
//  Created by JeongTaek Han on 2021/11/14.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        NSDecimalNumber(decimal: self).doubleValue
    }
}

extension String {
    func split(with target: Character) -> [String] {
        components(separatedBy: String(target))
    }
}
