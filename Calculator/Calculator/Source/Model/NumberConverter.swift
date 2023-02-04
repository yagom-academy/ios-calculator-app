//
//  NumberConverter.swift
//  Calculator
//
//  Created by Harry on 2023/02/02.
//

import Foundation

enum NumberConverter {
    static func convertFormattedString(text: String) -> String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumFractionDigits = 20
        
        guard let formattedNumber = numberFormatter
            .string(for: Double(text)) else { return text }
        return formattedNumber
    }
}
