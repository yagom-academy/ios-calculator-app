//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 예거 on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue {
    private(set) var numberArray: [Double] = []
    private(set) var mathOperatorArray: [MathOperator] = []

    mutating func enQueueNumberArray(item: Double) {
        numberArray.append(item)
    }
    
    mutating func enQueueMathOperator(item: MathOperator) {
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
    
    mutating func deQueueMathOperatorArray() -> MathOperator? {
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
