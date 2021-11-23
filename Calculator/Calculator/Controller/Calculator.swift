//
//  Calculator.swift
//  Calculator
//
//  Created by 예거 on 2021/11/23.
//

import UIKit

enum Calculator {
    static let emptyString: String = ""
    static let decimalPoint: String = "."
    static let decimalComma: String = ","
    static let negativeSign: String = "-"
    static let defaultOperandLabel: String = "0"
    static let numberFormatter = NumberFormatter()
    static let hapticGenerator = UISelectionFeedbackGenerator()
    
    static func applyNumberFormatter() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.roundingMode = .halfUp
    }
}
