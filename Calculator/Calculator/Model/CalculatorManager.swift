//
//  Number.swift
//  Calculator
//
//  Created by 1 on 2021/11/18.
//

import Foundation

class CalculatorManager {
    private (set) var value: String
    private (set) var isBiggerThan0: Bool
    let numberFormatter = CustomNumberFormatter()
    
    init(value: String = "0", isBiggerThan0: Bool = true) {
        self.value = value
        self.isBiggerThan0 = isBiggerThan0
    }
    
    func updateValue(with input: String) {
        let digitCount = value.filter{ $0.isNumber }.count
        let validDigitCount = 20
        
        guard digitCount < validDigitCount else {
            return
        }
        
        if value.contains(".") && input == "." {
            return
        }
        
        if value == "0" && input == "." {
            value = "0."
            return
        } else if input == "."{
            value += input
            return
        } else if value.contains(".") && input == "00" {
            value += input
            return
        } else if input == "0" {
            value += input
            return
        } else {
            value += input
        }
        
        let formattedNumber = self.textualRepresentation()
        value = formattedNumber
    }
    
    func toggleSign() {
        if value == "0" || value == "0." {
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
    
    private func textualRepresentation() -> String {
        let withoutComma = self.value.filter { $0 != "," }
        guard let double = Double(withoutComma) else {
            return "NaN"
        }
        let result = numberFormatter.string(from: NSNumber(value: double))
        return result!
    }
    
    func textualRepresentation(with value: Double) -> String {
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

