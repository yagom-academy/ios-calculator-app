//
//  StringExtension.swift
//  Calculator
//
//  Created by Wonhee on 2020/12/08.
//

import Foundation

extension String {
    func DecimalComma() -> String? {
        let numberStringArray = self.split(separator: ".").map { value -> String in
            return String(value)
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let decimalNumberString = numberStringArray.first,
              let decimalNumber = Int(decimalNumberString),
              let formattedNumber = numberFormatter.string(from: NSNumber(value: decimalNumber)) else {
            return nil
        }
        
        return formattedNumber + (numberStringArray.last ?? "")
    }
}
