//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Hamo on 2022/09/20.
//

import CoreText

struct CalculatorItemQueue {
    private var queue = LinkedList()
    
    mutating func enqueue(_ data: CalculateItem) {
        queue.append(data)
    }
    
    mutating func dequeue() -> CalculateItem? {
        return queue.removeFirst()
    }
    
    mutating func removeAll() {
        queue.removeAll()
    }
    
    func bringQueue() -> LinkedList {
        return queue
    }
}
