//
//  Extension.swift
//  Calculator
//

import Foundation
import UIKit

let numberFormatter = NumberFormatter()

extension Double: CalculateItem {}

extension String {
    func split(with target: Character) -> [String] {
        let subStrings = self.split(separator: target)
        var strings: [String] = []
        
        subStrings.forEach { strings.append(String($0)) }
        return strings
    }
    
    func applyNumberFormatter() -> String {
        numberFormatter.numberStyle = .decimal // 3자리마다 , 를 찍어주는 역할
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20 // 유효자리수를 설정해주는 역할
        
        guard self.contains(".") else {
            guard let number: NSNumber = numberFormatter.number(from: self),
                  let returnValue = numberFormatter.string(from: number) else {
                return ""
            }
            return returnValue
        }
        
        let stringsSplitedByDot: [String] = self.split(with: ".")
        
        guard let numberBeforeDot: NSNumber = numberFormatter.number(from: stringsSplitedByDot[0]),
              let returnValue = numberFormatter.string(from: numberBeforeDot) else {
            return ""
        }
        return returnValue + "." + stringsSplitedByDot[1]
    }
}

extension UIButton {
    var operatorRawValue: String {
        switch self.currentTitle {
        case "+":
            return String(Operator.add.rawValue)
        case "-":
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
