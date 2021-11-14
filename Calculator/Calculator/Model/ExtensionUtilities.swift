//
//  ExtensionUtilities.swift
//  Calculator
//
//  Created by JeongTaek Han on 2021/11/14.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
