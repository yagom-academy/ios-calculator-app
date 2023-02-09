//  Calculator - NumberFormatter+Extension.swift
//  created by vetto on 2023/02/05

import Foundation

extension NumberFormatter {
    static func convertToString(fromDouble: Double) -> String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumFractionDigits = Number.maxSignificantDigits
        
        guard let number = numberFormatter.string(for: fromDouble) else { return Symbol.empty }
        
        return number
    }
    
    static func convertToString(fromString: String) -> String {
        let number = fromString.filter({ $0 != Character(Symbol.comma) })
        guard let doubleInput = Double(number) else { return Symbol.empty }
        
        return convertToString(fromDouble: doubleInput)
    }
}
