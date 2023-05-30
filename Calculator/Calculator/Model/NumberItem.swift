//
//  NumberItem.swift
//  Calculator
//
//  Created by myungsun on 2023/05/30.
//

import Foundation

struct NumberItem: CalculateItem {
    private static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 20
        formatter.roundingMode = .halfUp
        return formatter
    }()
    private(set) var number: Double
    var numberDescription: String {
        return NumberItem.numberFormatter.string(from: NSNumber(value: number)) ?? "0"
    }
}
