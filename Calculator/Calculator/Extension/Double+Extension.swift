//
//  Double+Extension.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/06/06.
//

import Foundation

extension Double: CalculateItem {
    func formatNumbers() -> String {
        let numberFormat = NumberFormatter()
        let number = NSNumber(value: self)
        numberFormat.numberStyle = .decimal
        numberFormat.usesSignificantDigits = true
        numberFormat.maximumSignificantDigits = 20
        
        return String(numberFormat.string(from: number) ?? "")
    }
}
