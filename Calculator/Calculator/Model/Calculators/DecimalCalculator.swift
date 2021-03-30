//
//  Calculator.swift
//  Calculator
//
//  Created by 김찬우 on 2021/03/30.
//

import Foundation


struct DecimalCalculator: Subtractable, Addable, TypeConvertible {
    var stack = Stack<Double>()
    var userInputNumber: Double = 0
    var userInputOperator: Operator
    
}

