//
//  Extension.swift
//  Calculator
//
//  Created by Rowan on 2023/02/06.
//

import UIKit

extension Int: CalculateItem {}

extension Double: CalculateItem {}

extension String {
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
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

extension UILabel {
    convenience init(text: String) {
        self.init()
        self.text = text
        self.textColor = UIColor.white
        self.font = UIFont.preferredFont(forTextStyle: .title3)
    }
}

extension UIStackView {
    convenience init(subviews: UIView...) {
        self.init()
        for subview in subviews {
            self.addArrangedSubview(subview)
        }
        self.spacing = 8
    }
    
    func removeAllSubviews() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
}
