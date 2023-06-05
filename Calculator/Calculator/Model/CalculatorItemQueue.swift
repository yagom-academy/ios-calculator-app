//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Yetti on 2023/05/30.

struct CalculatorItemQueue<T: CalculateItem>: DoubleStackQueue {
    private var enqueueStack: [T] = []
    private var dequeueStack: [T] = []
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        enqueueStack.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard isEmpty == false else { return nil }
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
    
    func peek() -> T? {
        guard isEmpty == false else { return nil }
        if dequeueStack.count > 0 {
            return dequeueStack.last
        } else if enqueueStack.count > 0 {
            return enqueueStack.first
        }
        return nil
    }
    
    mutating func clear() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
    }
}
