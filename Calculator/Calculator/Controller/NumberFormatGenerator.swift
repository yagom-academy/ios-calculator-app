//
//  NumberFormatGenerator.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/24.
//

import Foundation

enum NumberFormatGenerator {
    static func createNumberFormatter() -> NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        
        return numberFormatter
    }
}
