//
//  String.swift
//  Calculator
//

import Foundation

let numberFormatter = NumberFormatter()

extension String {
    func split(with target: Character) -> [String] {
        let subStrings = self.split(separator: target)
        var strings: [String] = []
        
        subStrings.forEach { strings.append(String($0)) }
        return strings
    }
    
    func applyNumberFormatterAtMainLabel() -> String {
        numberFormatter.setDefaultFormat()
        
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
    
    func applyNumberFormatterAtFormulaHistoryView() -> String {
        numberFormatter.setDefaultFormat()
        
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
