//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 천승현 on 2023/01/25.
//

import Foundation

struct CalculatorItemQueue<T> {
    
    private(set) var enqueueStack: [T] = []
    private(set) var dequeueStack: [T] = []
    
    mutating func resetAllElement() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
    }
    
    mutating func enqueueCurrentItem(_ element: T) {
        enqueueStack.append(element)
    }
    
    @discardableResult
    mutating func dequeueCurrentItem() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}
