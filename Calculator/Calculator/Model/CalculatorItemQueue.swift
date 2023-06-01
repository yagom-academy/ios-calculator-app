//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by mint on 2023/05/30.
//

import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    private var enqueueStack: [T] = []
    private var dequeueStack: [T] = []
    var count: Int {
        return enqueueStack.count + dequeueStack.count
    }
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    var first: T? {
        if enqueueStack.isEmpty {
            return dequeueStack.last
        } else if dequeueStack.isEmpty {
            return enqueueStack.first
        } else {
            return dequeueStack.last
        }
    }
    var last: T? {
        if dequeueStack.isEmpty {
            return enqueueStack.last
        } else if enqueueStack.isEmpty {
            return dequeueStack.first
        } else {
            return enqueueStack.last
        }
    }
    
    mutating func enqueue(_ input: T) {
        enqueueStack.append(input)
    }
    
    mutating func dequeue() -> T? {
        guard isEmpty == false else {
            return nil
        }
        
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        
        return dequeueStack.removeLast()
    }
    
    mutating func clear() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
    }
}
