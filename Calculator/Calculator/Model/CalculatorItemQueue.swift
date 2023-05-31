//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Serena on 2023/05/29.
//

struct CalculatorItemQueue {
    private(set) var queue: [any CalculateItem]
    
    init(queue: [any CalculateItem] = []) {
        self.queue = queue
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
}
