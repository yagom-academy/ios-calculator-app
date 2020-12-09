//
//  CalculatorData.swift
//  Calculator
//
//  Created by Wonhee on 2020/12/08.
//

import Foundation

protocol CalculatorData {
    var value: String { get set }
}

struct DecimalData: CalculatorData {
    var value: String
    var type: DecimalOperatorType?
    
    init(value: String, type: DecimalOperatorType?) {
        self.value = value
        self.type = type
    }
}

struct BinaryData: CalculatorData {
    var value: String
    var type: BinaryOperatorType?
    
    init(value: String, type: BinaryOperatorType?) {
        self.value = value
        self.type = type
    }
}
