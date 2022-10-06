//
//  Converter.swift
//  Calculator
//
//  Created by Junho, Baem on 2022/10/06.
//

import Foundation

struct Converter {
    func convertStringContainingCommaToDouble(_ input: String) -> Double? {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ","
        return numberFormatter.number(from: input)?.doubleValue
    }
}
