//  Calculator - StringExtension.swift
//  created by vetto on 2023/01/27

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
    
    func numberFormatting() -> String {
        var stringArray = self.split(with: ".")
        stringArray[0] = integerFormatting(stringArray[0])
        if self.contains(".") {
            if Double(stringArray[1]) == 0 {
                stringArray.removeLast()
            }
        }
        
        return stringArray.joined(separator: ".")
    }
    
    func integerFormatting(_ input: String) -> String {
        var numberFormatter: NumberFormatter {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.maximumFractionDigits = 20
            numberFormatter.roundingMode = .halfUp
            
            return numberFormatter
        }
        
        let number = input.components(separatedBy: ",").joined()
        guard let numberString = numberFormatter.string(for: Double(number)) else { return "" }
        
        return numberString
    }
}
