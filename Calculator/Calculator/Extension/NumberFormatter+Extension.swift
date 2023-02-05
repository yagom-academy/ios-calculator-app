//  Calculator - NumberFormatter+Extension.swift
//  created by vetto on 2023/02/05

import Foundation

extension NumberFormatter {
    static func convertToDecimal(input: Double) -> String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumSignificantDigits = 20
        
        return ""
    }
}
