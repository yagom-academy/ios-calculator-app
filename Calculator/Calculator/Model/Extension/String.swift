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
    
    func applyNumberFormatterAtMainLabel() -> String {
        let splitedByDot: [String] = self.split(with: ".")
        
        guard let number: NSNumber = numberFormatter.number(from: splitedByDot[0]),
              let stringBeforeDot: String = numberFormatter.string(from: number) else { return "" }
        return splitedByDot[1...].reduce(into: stringBeforeDot) { $0.append("." + $1) }
    }
    
    func applyNumberFormatterAtFormulaHistoryView() -> String {
        guard let number: NSNumber = numberFormatter.number(from: self),
              let returnValue: String = numberFormatter.string(from: number) else { return "" }
        return returnValue
    }
    
    func split(with target: Character) -> [String] {
        let splitComponents = self.split(separator: target, omittingEmptySubsequences: true)
        
        return splitComponents.map(String.init)
    }
}
