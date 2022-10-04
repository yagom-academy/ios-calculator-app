//
//  NumberFormatter.swift
//  Calculator
//

import Foundation

extension NumberFormatter {
    func setDefaultFormat() {
        self.numberStyle = .decimal
        self.usesSignificantDigits = true
        self.maximumSignificantDigits = 20
    }
}
