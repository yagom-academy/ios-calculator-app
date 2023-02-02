//
//  String+.swift
//  Calculator
//
//  Created by Jinah Park on 2023/01/30.
//

import Foundation

extension String {
    var insertComma: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let splittedNumber = self.components(separatedBy: ".")
        if splittedNumber.count == 1 {
            guard let intValue = Int(splittedNumber[0]) else {
                return self
            }
            return numberFormatter.string(from: NSNumber(value: intValue)) ?? self
        } else if splittedNumber.count == 2 {
            guard let intNumberBeforeDecimalPoint = Int(splittedNumber[0]) else {
                return self
            }
            let numberBeforeDecimalPoint = numberFormatter.string(from: NSNumber(value: intNumberBeforeDecimalPoint)) ?? self
            let wholeNumber = numberBeforeDecimalPoint + "." + splittedNumber[1]
            return wholeNumber
        }
        return self
    }
    
    var floorIfZero: String {
        let splittedNumber = self.components(separatedBy: ".")
        if splittedNumber.count == 2, Int(splittedNumber[1]) == 0 {
            return splittedNumber[0]
        }
        return self
    }
    
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }
}
