//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 이원빈 on 2022/05/16.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    private var dequeueStack = Array<T>()
    private var enqueueStack = Array<T>()
    var isEmpty: Bool {
        return dequeueStack.isEmpty && enqueueStack.isEmpty
    }
    var peek: T? {
        return !dequeueStack.isEmpty ? dequeueStack.last : enqueueStack.first
    }
    var currentStack: [T] {
        return dequeueStack.reversed() + enqueueStack
    }
    
    mutating func enqueue(_ element: T) {
        enqueueStack.append(element)
    }
    
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}
