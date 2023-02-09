//
//  String+extension.swift
//  Calculator
//
//  Created by 김성준 on 2023/02/09.
//

import Foundation

extension String: CalculateItem {
    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        return numberFormatter
    }
    
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
    
    func applyFormatter() -> String {
        guard let value = numberFormatter.string(for: Double(self.removeComma())) else {
            return Sign.empty
        }
        return value
    }
    
    func removeComma() -> String {
        return self.replacingOccurrences(of: Sign.comma, with: Sign.empty)
    }
    
    func removeDotAndNegative() -> String {
        return self
            .replacingOccurrences(of: String(Sign.dot), with: Sign.empty)
            .replacingOccurrences(of: String(Sign.negative), with: Sign.empty)
    }
}
