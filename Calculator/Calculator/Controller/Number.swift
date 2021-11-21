//
//  Number.swift
//  Calculator
//
//  Created by 1 on 2021/11/18.
//

import Foundation

class NumberManager {
    private (set) var value: String
    private (set) var isBiggerThan0: Bool
    let numberFormatter = Formmater().formatter
    
    init(value: String = "0" , isBiggerThan0: Bool = true) {
        self.value = value
        self.isBiggerThan0 = true
    }
    
    func updateValue(with input: String) {
        let digitCount = value.filter{ $0.isNumber }.count
        guard digitCount < 20 else {
            return
        }
        
        if value.contains(".") && input == "." {
            return
        }
        
        if value == "0" && input == "." {
            value = "0."
            return
        } else if value == "0" {
            value = input
        } else if input == "."{
            value += input
            return
        } else {
            value += input
        }
        
        let formattedNumber = self.formatter(value)
        value = formattedNumber
    }
    
    func toggleSign() {
        guard value != "0" else {
            return
        }
        isBiggerThan0 = !isBiggerThan0
        toggleValueSign()
    }
    
    private func toggleValueSign() {
        if value.contains("-") {
            value.remove(at: value.startIndex)
        } else {
            value.insert("-", at: value.startIndex)
        }
    }
    
    func formatter(_ value: String) -> String {
        let withoutComma = value.filter { $0 != "," }
        guard let double = Double(withoutComma) else {
            return "NaN"
        }
        let result = numberFormatter.string(from: NSNumber(value: double))
        return result!
    }
    
    func formatter(_ value: Double) -> String {
        if let result = numberFormatter.string(from: NSNumber(value: value)) {
            return result
        }
        return "NaN"
    }
    
    func reset() {
        value = "0"
        isBiggerThan0 = true
    }
}

extension NumberManager {
    class Formmater {
        let formatter : NumberFormatter
        init() {
            formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 20
            formatter.usesSignificantDigits = true
            formatter.maximumSignificantDigits = 20
            formatter.roundingMode = .ceiling
        }
    }
}
