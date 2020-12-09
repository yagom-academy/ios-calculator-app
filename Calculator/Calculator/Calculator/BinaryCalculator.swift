//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by Wonhee on 2020/12/08.
//

import Foundation

class BinaryCalculator {
    static let shared: BinaryCalculator = BinaryCalculator()
    private init() {}
    
    private var binaryStack = Stack<CalculatorData>()
}
