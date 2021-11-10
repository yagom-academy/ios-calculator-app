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
    var isEmpty: Bool = true
    
    mutating func enqueue(operation: T) {
        operationStorage.append(operation)
        self.isEmpty = false
    }
    
    mutating func dequeue() -> T? {
        if self.isEmpty {
            return nil
        }
        
        let operation = operationStorage.removeFirst()
        return operation
    }
}

