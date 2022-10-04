//
//  Double+convertStringContainingCommaToDouble.swift
//  Calculator
//
//  Created by junho lee on 2022/10/03.
//

import Foundation

extension Double {
    static func convertStringContainingCommaToDouble(_ input: String) -> Double? {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ","
        return numberFormatter.number(from: input)?.doubleValue
    }
}
