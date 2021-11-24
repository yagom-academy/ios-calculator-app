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
        
        return operationStorage.removeFirst()
    }
 
    func countAllItem() -> Int {
        return operationStorage.count
    }
}


