//
//  CalculatorQueue.swift
//  Calculator
//
//  Created by Sunwoo on 2021/11/09.
//

import Foundation

protocol CalculatorItem {
    
}

struct CalculatorItemQueue <Element: CalculatorItem> {
    private var operationStorage: [Element] = []
    
    mutating func enqueue(operation: Element) {
        operationStorage.append(operation)
    }
    
    mutating func dequeue() -> Element? {
        if operationStorage.isEmpty {
            return nil
        }
        
        let operation = operationStorage.removeFirst()
        return operation
    }
 
    func countAllItem() -> Int {
        return operationStorage.count
    }
}


