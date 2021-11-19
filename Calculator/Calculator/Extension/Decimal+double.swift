//
//  Extension+Decimal.swift
//  Calculator
//
//  Created by 이차민 on 2021/11/18.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
