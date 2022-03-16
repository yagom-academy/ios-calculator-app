//  CalculateItemQueue.swift
//  Calculator
//  Created by LIMGAUI on 2022/03/15.

import Foundation

struct CalculateItemQueue {
    private var queue = LinkedList()
    
    var count: Int {
        return queue.count
    }
    
    var isEmpty: Bool {
        return queue.count > 0
    }
    
    mutating func enqueue(_ node: Int) {
        queue.append(data: node)
    }
    
    mutating func dequeue() -> Int? {
        return isEmpty ? nil : queue.removeFirst()
    }
}
