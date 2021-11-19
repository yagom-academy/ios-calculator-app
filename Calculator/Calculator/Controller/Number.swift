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
    
    func reset() {
        value = "0"
        isBiggerThan0 = true
    }
}
