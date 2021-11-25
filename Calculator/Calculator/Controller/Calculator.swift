//
//  Calculator.swift
//  Calculator
//
//  Created by 예거 on 2021/11/23.
//

import UIKit

enum Calculator {
    static let hapticGenerator = UISelectionFeedbackGenerator()
    static let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.roundingMode = .halfUp
        return numberFormatter
    }()
}

extension Character {
    static let whiteSpace: Character = " "
}

extension String {
    static let empty: String = ""
    static let zero: String = "0"
    static let decimalPoint: String = "."
    static let decimalComma: String = ","
    static let negativeSign: String = "-"
}
