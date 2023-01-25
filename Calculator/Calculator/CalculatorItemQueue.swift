//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 송종환 on 2023/01/25.
//

import Foundation

protocol CalculateItem {
}

struct CalculatorItemQueue<T>: CalculateItem {
    
    var enqueueStack: [T] = []
    var dequeueStack: [T] = []
    
    
    var enequeueStackcount: Int {
        return enqueueStack.count
    }
    
    var dequeueStackcount: Int {
        return dequeueStack.count
    }
        
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    mutating func enqueueItem(_ element: T) {
        enqueueStack.append(element)
    }
    
    @discardableResult
    mutating func dequeueItem() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
            return dequeueStack.popLast()
    }
}



