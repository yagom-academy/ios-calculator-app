//
//  NumberFormatter+extension.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/25.
//

import Foundation

extension NumberFormatter {
    static let calculator: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 10
        return numberFormatter
    }()
}
