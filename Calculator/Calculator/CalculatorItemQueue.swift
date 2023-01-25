//  Model.swift
//  Calculator
//  Created by kimseongjun on 2023/01/25.
//

import Foundation

protocol CalculatorItem {
    
}


struct CalculatorItemQueue<T>: CalculatorItem {
    
    var dequeueStack: [T] = []
    var enqueueStack: [T] = []
    
    var isEmpty: Bool {
        return dequeueStack.isEmpty && enqueueStack.isEmpty
    }
    var peek: T? {
        return !dequeueStack.isEmpty ? dequeueStack.last : enqueueStack.first
    }
    
    
    mutating func enqueue(item: T) {
        enqueueStack.append(item)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}
