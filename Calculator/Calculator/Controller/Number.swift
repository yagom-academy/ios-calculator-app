//
//  Number.swift
//  Calculator
//
//  Created by 1 on 2021/11/18.
//

import Foundation

class Number {
    private (set) var value: String
    private (set) var isBiggerThan0: Bool
    
    init(value: String = "0" , isBiggerThan0: Bool = true) {
        self.value = value
        self.isBiggerThan0 = true
    }
    
    func updateValue(with input: String) {
        if value.contains(".") && input == "." {
            return
        }
        
        if value == "0" && input == "." {
            value = "0."
        } else if value == "0" {
            value = input
        } else {
            value += input
        }
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
    
    func formmater(_ value: String) -> String {
        guard let double = Double(value) else {
            return "NaN"
        }
        let numberFormmater = NumberFormatter()
        numberFormmater.numberStyle = .decimal
        let result = numberFormmater.string(from: NSNumber(value: double))
        return result!
    }
    
    func reset() {
        value = "0"
        isBiggerThan0 = true
    }
}
