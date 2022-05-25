//
//  Double.swift
//  Calculator
//
//  Created by NAMU on 2022/05/19.
//

import Foundation

extension Double {
    func parse() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumSignificantDigits = 20
        let result = numberFormatter.string(for: self) ?? ""
        return result
    }
}
