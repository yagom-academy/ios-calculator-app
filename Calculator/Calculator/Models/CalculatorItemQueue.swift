//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Charles on 2023/10/05.
//

struct CalculatorItemQueue<T: CalculateItem> {
    private(set) var dequeueContainer: [T] = []
    private(set) var enqueueContainer: [T] = []
    
    var isEmpty: Bool {
        dequeueContainer.isEmpty && enqueueContainer.isEmpty
    }
    
    var peek: T? {
        !dequeueContainer.isEmpty ? dequeueContainer.last : enqueueContainer.first
    }
    
    mutating func dequeue() -> T? {
        if dequeueContainer.isEmpty {
            dequeueContainer = enqueueContainer.reversed()
            enqueueContainer.removeAll()
        }
        
        return dequeueContainer.popLast()
    }
    
    mutating func enqueue(_ element: T) {
        enqueueContainer.append(element)
    }
}
