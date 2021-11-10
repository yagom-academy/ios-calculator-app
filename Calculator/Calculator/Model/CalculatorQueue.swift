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
    
    mutating func dequeue() -> T? {
        let operation = operationStorage.removeFirst()
        return operation
    }
}

