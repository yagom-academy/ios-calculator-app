//
//  UILabel.swift
//  Calculator
//

import UIKit

extension UILabel {
    var rawvalueByOperatorLabelText: String {
        switch self.text {
        case "+":
            return String(Operator.add.rawValue)
        case "−":
            return String(Operator.subtract.rawValue)
        case "×":
            return String(Operator.multiply.rawValue)
        case "÷":
            return String(Operator.divide.rawValue)
        default:
            return ""
        }
    }
}
