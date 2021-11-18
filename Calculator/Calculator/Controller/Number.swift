//
//  Number.swift
//  Calculator
//
//  Created by 1 on 2021/11/18.
//

import Foundation

class Number {
    var value: String
    var isBiggerThan0: Bool
    
    init(value: String = "0" , isBiggerThan0: Bool = true) {
        self.value = value
        self.isBiggerThan0 = true
    }
    
    func reset() {
        value = "0"
        isBiggerThan0 = true
    }
}
