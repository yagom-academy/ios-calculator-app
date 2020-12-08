//
//  CalculatorData.swift
//  Calculator
//
//  Created by Wonhee on 2020/12/08.
//

import Foundation

struct CalculatorData {
    var value: String
    var type: CalculatorType
    
    init(value: String, type: CalculatorType) {
        self.value = value
        self.type = type
    }
}
