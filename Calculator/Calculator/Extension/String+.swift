//
//  Calculator - String+.swift
//  Created by Rhode, Songjun.
//  Copyright © yagom. All rights reserved.
//

import Foundation

extension String {
    var stringWithComma: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let splittedNumber = self.components(separatedBy: ".")
        if splittedNumber.count == 1 {
            guard let decimalValue = Decimal(string: splittedNumber[0]) else {
                return self
            }
            return numberFormatter.string(from: decimalValue as NSNumber) ?? self
        } else if splittedNumber.count == 2 {
            guard let decimalNumberBeforeDecimalPoint = Decimal(string: splittedNumber[0]) else {
                return self
            }
            let numberBeforeDecimalPoint = numberFormatter.string(from: decimalNumberBeforeDecimalPoint as NSNumber) ?? self
            let wholeNumber = numberBeforeDecimalPoint + "." + splittedNumber[1]
            return wholeNumber
        }
        return self
    }
    
    var floorIfZero: String {
        let splittedNumber = self.components(separatedBy: ".")
        guard splittedNumber.count == 2 else {
            return self
        }
        var numberAfterDecimalPoint = splittedNumber[1]
        while let last = numberAfterDecimalPoint.last {
            if last == "0" {
                numberAfterDecimalPoint.removeLast()
            } else {
                break
            }
        }
        if numberAfterDecimalPoint.isEmpty {
            return splittedNumber[0]
        } else {
            return splittedNumber[0] + "." + numberAfterDecimalPoint
        }
    }
    
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }
}
