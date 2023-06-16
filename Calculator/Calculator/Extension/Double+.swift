//
//  Double+.swift
//  Calculator
//
//  Created by karen, Mary.
//

import Foundation

extension Double: CalculateItem {}

extension Double {
    func changeNumberFormat() -> String? {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 21
        
        return numberFormatter.string(for: self)
    }
}
