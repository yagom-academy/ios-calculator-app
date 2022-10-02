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
    
    func applyNumberFormatterInMainLabel() -> String {
        numberFormatter.numberStyle = .decimal // 3자리마다 , 를 찍어주는 역할
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20 // 유효자리수를 설정해주는 역할
        
        if self.contains(".") {
            let splitedByDot: [String] = self.split(with: ".")
            
            guard let number: NSNumber = numberFormatter.number(from: splitedByDot[0]),
                  let stringBeforeDot: String = numberFormatter.string(from: number) else {
                      return ""
                  }
            return stringBeforeDot + "." + splitedByDot[1]
        }
        
        guard let number: NSNumber = numberFormatter.number(from: self),
              let returnValue: String = numberFormatter.string(from: number) else {
            return ""
        }
        return returnValue
    }
    
    func applyNumberFormatterInFormulaHistoryView() -> String {
        numberFormatter.numberStyle = .decimal // 3자리마다 , 를 찍어주는 역할
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20 // 유효자리수를 설정해주는 역할
        
        guard let number: NSNumber = numberFormatter.number(from: self),
              let returnValue: String = numberFormatter.string(from: number) else {
            return ""
        }
        return returnValue
    }
    
    func removeComma() -> String {
        return self.components(separatedBy: ",").joined()
    }
}

extension Optional where Wrapped == String {
    func removeComma() -> String {
        if let strings: String = self {
            return strings.components(separatedBy: ",").joined()
        }
        return ""
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
