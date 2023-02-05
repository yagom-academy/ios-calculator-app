//
//  Calculator - CalculatorFormatter.swift
//  Created by Rhode.
//  Copyright © yagom. All rights reserved.
//
import Foundation

class CalculatorFormatter {
    static let shared = CalculatorFormatter()
    private init() {}
    
    func roundingNumber(from number: Double) -> String {
        let numberFormatter = NumberFormatter() 
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.roundingMode = .ceiling
        let result = numberFormatter.string(for: number) ?? String(number)
        return result
    }
}
