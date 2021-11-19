//
//  String+addComma.swift
//  Calculator
//
//  Created by 이차민 on 2021/11/19.
//

import Foundation

extension String {
    func addCommaOnEveryThreeDigits() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.roundingMode = .halfUp
        formatter.maximumSignificantDigits = 20
        guard let number = formatter.number(from: self), let doubleValue = Double("\(number)")  else {
            return nil
        }

        guard let result = formatter.string(from: NSNumber(value: doubleValue)) else {
            return nil
        }
        
        return result
    }
}
