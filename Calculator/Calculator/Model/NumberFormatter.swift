//
//  NumberFormatter.swift
//  Calculator
//
//  Created by Aron, mene on 4/10/2022.
//

import Foundation

final class CalculatorFormatter {
    static let shared = CalculatorFormatter()
    private let formatter = NumberFormatter()
    
    private init() {
        formatter.numberStyle = .decimal
    }

    func numberFormatter(number: String) -> String {
        guard let decimalNumber = Double(number) else {
            return number
        }
        return formatter.string(from: NSNumber(value: decimalNumber))!
    }
}
