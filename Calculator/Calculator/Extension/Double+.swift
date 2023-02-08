//
//  Calculator - Double+.swift
//  Created by Rhode, Songjun.
//  Copyright © yagom. All rights reserved.
//
import Foundation

extension Double: CalculateItem {
    func roundingNumber() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.roundingMode = .halfUp
        let result = numberFormatter.string(for: self) ?? String(self)
        return result
    }
}
