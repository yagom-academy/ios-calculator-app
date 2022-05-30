//
//  Double+Extensions.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/18.
//

import Foundation

extension Double: CalculateItem {
    func setDoubleFormatter() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
