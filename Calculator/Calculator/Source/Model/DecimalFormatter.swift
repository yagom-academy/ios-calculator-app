//
//  DecimalFormatter.swift
//  Calculator
//
//  Created by Harry on 2023/02/02.
//

import Foundation

enum DecimalFormatter {
    static func convertFormattedString(text: String) -> String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumFractionDigits = 20
        
        guard let formattedNumber = numberFormatter
            .string(for: Decimal(string: text)) else { return text }
        return formattedNumber
    }
}

