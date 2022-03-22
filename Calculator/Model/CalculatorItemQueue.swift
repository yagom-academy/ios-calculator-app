//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김태훈 on 2022/03/15.
//
import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    private var dequeueStack: [T] = []
    private var enqueueStack: [T] = []
    
    var head: T? {
       return dequeueStack.isEmpty ? enqueueStack.first : dequeueStack.last
    }
    
    var count: Int {
        return enqueueStack.count
    }
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    var first: T? {
        return enqueueStack.first
    }
    
    var last: T? {
        return enqueueStack.last
    }
    
    mutating func enqueue(value: T) {
        enqueueStack.append(value)
    }
    
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}

extension Double: CalculateItem {
}


