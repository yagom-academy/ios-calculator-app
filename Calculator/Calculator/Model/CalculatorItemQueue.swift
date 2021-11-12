//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 예거 on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue {
    private(set) var numberArray: [Double] = []
    private(set) var mathOperatorArray: [Operator] = []

    mutating func enQueueNumberArray(item: Double) {
        numberArray.append(item)
    }
    
    mutating func enQueueMathOperatorArray(item: Operator) {
        mathOperatorArray.append(item)
    }
    
    mutating func deQueueNumberArray() -> Double? {
        switch numberArray.isEmpty {
        case true:
            return nil
        case false:
            return numberArray.removeFirst()
        }
    }
    
    mutating func deQueueMathOperatorArray() -> Operator? {
        switch mathOperatorArray.isEmpty {
        case true:
            return nil
        case false:
            return mathOperatorArray.removeFirst()
        }
    }
    
    mutating func clearBothArrays() {
        numberArray.removeAll()
        mathOperatorArray.removeAll()
    }
}
