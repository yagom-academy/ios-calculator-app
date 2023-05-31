//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by mint on 2023/05/30.
//

import Foundation

struct CalculatorItemQueue<T>: CalculatorItem {
    private var enqueueStack: [T] = []
    private var dequeueStack: [T] = []
    var count: Int {
        return enqueueStack.count + dequeueStack.count
    }
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    var first: T? {
        if !dequeueStack.isEmpty {
            return dequeueStack.last
        } else {
            return enqueueStack.first
        }
    }
    var last: T? {
        if !enqueueStack.isEmpty {
            return enqueueStack.last
        } else {
            return dequeueStack.first
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
        enqueueStack = []
        dequeueStack = []
    }
}
