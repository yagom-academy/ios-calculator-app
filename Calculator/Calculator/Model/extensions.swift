//
//  extensions.swift
//  Calculator
//
//  Created by 혜모리 on 2023/01/27.
//

import Foundation

extension String: CalculateItem {
    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .halfUp
        return numberFormatter
    }
    
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
    
    func applyFormatter() -> String {
        guard let value = numberFormatter.string(for: Double(self)) else { return "" }
        return value
    }
}

extension Double: CalculateItem {
    
}
