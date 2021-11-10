//
//  CalculatorQueue.swift
//  Calculator
//
//  Created by Sunwoo on 2021/11/09.
//

import Foundation

protocol CalculatorItem {
    
}

struct CalculatorItemQueue <T> where T: CalculatorItem {
    var operationStorage: [T] = []
    
    mutating func enqueue(operation: T) {
        operationStorage.append(operation)
    }
    
    mutating func dequeue() -> T {
        return operationStorage.removeFirst()
    }
}

