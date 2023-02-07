//
//  extensions.swift
//  Calculator
//
//  Created by 혜모리, 릴라 on 2023/01/27.
//

import Foundation

extension String: CalculateItem {
    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        return numberFormatter
    }
    
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
    
    func applyFormatter() -> String {
        guard let value = numberFormatter.string(for: Double(self.removeComma())) else { return "" }
        return value
    }
    
    func removeComma() -> String {
        return self.replacingOccurrences(of: ",", with: "")
    }
    
    func removeDotAndNegative() -> String {
        return self.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "-", with: "")
    }
}

extension Double: CalculateItem {
    
}
