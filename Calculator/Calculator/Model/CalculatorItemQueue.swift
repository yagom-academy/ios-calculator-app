//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by smfc on 19/9/2022.
//

struct CalculatorItemQueue<T: CalculateItem> {
    private(set) var dequeueStack: [T] = []
    private(set) var enqueueStack: [T] = []
    
    var count: Int {
        return dequeueStack.count + enqueueStack.count
    }
    
    var isEmpty: Bool {
        return dequeueStack.isEmpty && enqueueStack.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        enqueueStack.append(element)
    }
    
    mutating func clear() {
        dequeueStack = []
        enqueueStack = []
    }
    
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
    
    func peek() -> T? {
        if dequeueStack.isEmpty && enqueueStack.isEmpty {
            return nil
        } else if dequeueStack.isEmpty {
            return enqueueStack.first
        } else {
            return dequeueStack.last
        }
    }
}
