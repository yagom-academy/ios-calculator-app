//  Model.swift
//  Calculator
//  Created by kimseongjun on 2023/01/25.
//

import Foundation

protocol CalculatorItem { }


struct CalculatorItemQueue<T> {
    
    private(set) var dequeueStack: [T] = []
    private(set) var enqueueStack: [T] = []
    
    var isEmpty: Bool {
        return dequeueStack.isEmpty && enqueueStack.isEmpty
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
