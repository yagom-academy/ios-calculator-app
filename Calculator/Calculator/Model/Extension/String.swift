//
//  String.swift
//  Created by Wonbi
//

import Foundation

extension String {
    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20
        
        return numberFormatter
    }
    
    func addComma() -> String {
        guard Double(self) != nil, let result = numberFormatter.string(for: Double(self)) else { return self }
        return result
    }
    
    func addCommaInteger() -> String {
        let components: [String] = self.components(separatedBy: ExpressionText.dot)
        guard let integerPart = numberFormatter.string(for: Double(components[0])) else { return self }
        
        if components.count >= 2 {
            return integerPart + ExpressionText.dot + components[1]
        } else {
            return integerPart
        }
    }

    func split(with target: Character) -> [String] {
        let splitComponents = self.split(separator: target, omittingEmptySubsequences: true)
        
        return splitComponents.map(String.init)
    }
}
