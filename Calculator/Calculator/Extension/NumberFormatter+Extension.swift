//  Calculator - NumberFormatter+Extension.swift
//  created by vetto on 2023/02/05

import Foundation

extension NumberFormatter {
    static func convertToString(fromDouble: Double) -> String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumSignificantDigits = 20
        
        guard let number = numberFormatter.string(for: fromDouble) else { return "" }
        
        return number
    }
    
    static func convertToString(fromString: String) -> String {
        let number = fromString.filter({ $0 != Character(Symbol.comma) })
        guard let doubleInput = Double(number) else { return "" }
        
        return convertToString(fromDouble: doubleInput)
    }
}
