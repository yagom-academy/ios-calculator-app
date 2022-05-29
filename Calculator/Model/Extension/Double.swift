//
//  Double.swift
//  Calculator
//
//  Created by NAMU on 2022/05/19.
//

import Foundation

extension Double: CalculateItem {
    func parse() -> String {
        let numberFormatter = NumberFormatter()
        if self > 100000000000000000000.0 {
            numberFormatter.numberStyle = .scientific
        } else {
            numberFormatter.numberStyle = .decimal
        }
        numberFormatter.roundingMode = .up
        numberFormatter.maximumSignificantDigits = 20
        let result = numberFormatter.string(for: self) ?? ""
        return result
    }
}
