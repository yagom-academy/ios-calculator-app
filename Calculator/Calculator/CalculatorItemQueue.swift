//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by redmango1446 on 2023/05/30.
//

struct CalculatorItemQueue: CalculateItem {
    var enqueueStack: [String] = []
    var dequeueStack: [String] = []
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    mutating func enqueue(_ element: String) {
        enqueueStack.append(element)
    }
    
    mutating func dequeue() -> String? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        
        return dequeueStack.popLast()
    }
    
    mutating func clear() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
    }
}
