//
//  Formatter+.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/30.
//

import Foundation

extension Formatter {
    static let formattedNumber: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesSignificantDigits = true
        formatter.maximumSignificantDigits = 20
        
        return formatter
    }()
}
