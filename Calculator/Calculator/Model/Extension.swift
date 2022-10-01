//
//  Extension.swift
//  Calculator
//
//  Created by 김인호 on 2022/09/22.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let result = self.components(separatedBy: String(target))
        return result
    }
    
    func formatNumberToDecimal() -> String? {
        let inputWithoutComma = self.replacingOccurrences(of: ",", with: "")
        guard let convertedInput = Double(inputWithoutComma) else { return nil }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.roundingMode = .ceiling
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(for: convertedInput)
    }
}

extension Double: CalculateItem {
    
}
