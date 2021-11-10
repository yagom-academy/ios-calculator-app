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
    
    mutating func enQueue(operation: T) {
        operationStorage.append(operation)
    }
    
    mutating func deQueue() -> T? {
        if operationStorage.isEmpty {
            return nil
        }
        
        let operation = operationStorage.removeFirst()
        return operation
    }
    
    mutating func removeAllItem() {
        operationStorage.removeAll()
    }
}

