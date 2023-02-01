//
//  String+.swift
//  Calculator
//
//  Created by Jinah Park on 2023/01/30.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }
    
    var insertComma: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let splittedNumber = self.components(separatedBy: ".")
        if splittedNumber.count == 1 {
            guard let intValue = Int(splittedNumber[0]) else {
                return self
            }
            return numberFormatter.string(from: NSNumber(value: intValue)) ?? ""
        } else if splittedNumber.count == 2 {
            guard let intNumberBeforeDecimalPoint = Int(splittedNumber[0]) else {
                return self
            }
            let numberBeforeDecimalPoint = numberFormatter.string(from: NSNumber(value: intNumberBeforeDecimalPoint)) ?? ""
            let wholeNumber = numberBeforeDecimalPoint + "." + splittedNumber[1]
            return wholeNumber
        }
        return self
    }
    
    var floorIfZero: String {
        let numberFormatter = NumberFormatter()
        
        let splittedNumber = self.components(separatedBy: ".")
        if Int(splittedNumber[1]) == 0 {
            numberFormatter.roundingMode = .floor
            guard let doubleNumber = Double(self) else {
                return self
            }
            let flooredNumber = numberFormatter.string(for: doubleNumber) ?? ""
            return flooredNumber
        }
        return self
    }
}
