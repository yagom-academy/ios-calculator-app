//
//  DoubleExtension.swift
//  Calculator
//
//  Created by 써니쿠키 on 2022/09/22.
//

import Foundation

extension Double: CalculateItem {
    static let numberFormatter = NumberFormatter()

    var changeToDecimal: String {
        let maxDigits: Int = 20
        
        Self.numberFormatter.numberStyle = .decimal
        Self.numberFormatter.maximumSignificantDigits = maxDigits
        Self.numberFormatter.roundingMode = .up
    
        let result = Self.numberFormatter.string(from: self as NSNumber) ?? "0"
        
        return result
    }
}
