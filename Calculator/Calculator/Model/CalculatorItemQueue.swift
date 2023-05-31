//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Serena on 2023/05/29.
//

struct CalculatorItemQueue {
    private(set) var queue: [any CalculateItem]
    private(set) var reversedQueue: [any CalculateItem]
    
    init(queue: [any CalculateItem] = [], reversedQueue: [any CalculateItem] = []) {
        self.queue = queue
        self.reversedQueue = reversedQueue
    }
    
    mutating func enqueue(element: any CalculateItem) {
        queue.append(element)
    }
    
    var isEmpty: Bool {
        queue.isEmpty
    }
    
    var peek: (any CalculateItem)? {
        return queue.isEmpty ? nil : queue.first
    }
    
    mutating func dequeue() -> [any CalculateItem] {
        if reversedQueue.isEmpty {
            reversedQueue = queue.reversed()
        }
        return reversedQueue
    }
}
