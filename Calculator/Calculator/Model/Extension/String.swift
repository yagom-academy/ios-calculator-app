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
        guard let result = numberFormatter.string(for: Double(self)) else { return self }
        return result
    }
    
    func split(with target: Character) -> [String] {
        let splitComponents = self.split(separator: target, omittingEmptySubsequences: true)
        
        return splitComponents.map { String($0) }
    }
}
