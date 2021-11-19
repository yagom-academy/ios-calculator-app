//
//  Double+Extensions.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/15.
//

import Foundation

extension Double: CalculateItem {
    var presentingFormat: String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.roundingMode = .up
        guard let result = numberFormatter.string(from: NSNumber(value: self)) else {
            return nil
        }
        return result
    }
}
