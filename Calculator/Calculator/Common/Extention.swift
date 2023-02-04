//
//  Extention.swift
//  Calculator
//
//  Created by Rowan on 2023/01/27.
//

import UIKit

extension Int: CalculateItem {}

extension Double: CalculateItem {}

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}

extension NumberFormatter {
    func convertToDecimal(from string: String) -> String? {
        guard let double = convertToDouble(from: string) else { return nil }
        let decimalStyleString = convertToString(from: double)
        
        return decimalStyleString
    }
    
    func convertToDouble(from labelText: String) -> Double? {
        let splitedText = labelText.split(with: ",").joined()
        
        return Double(splitedText)
    }
    
    func convertToString(from double: Double) -> String? {
        let convertedDouble = NSNumber(value: double)
        let result = self.string(from: convertedDouble)
        
        return result
    }
    
    convenience init(numberStyle: NumberFormatter.Style,
                     roundingMode: NumberFormatter.RoundingMode,
                     usesSignificantDigits: Bool,
                     maximumSignificantDigits: Int) {
        self.init()
        self.numberStyle = numberStyle
        self.roundingMode = roundingMode
        self.usesSignificantDigits = usesSignificantDigits
        self.maximumSignificantDigits = maximumSignificantDigits
    }
}
