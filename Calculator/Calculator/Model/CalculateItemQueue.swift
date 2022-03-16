//  CalculateItemQueue.swift
//  Calculator
//  Created by LIMGAUI on 2022/03/15.

import Foundation

struct CalculateItemQueue<T: CalculateItem> {
    private var queue = LinkedList<T>()
    
    var count: Int {
        return queue.count
    }
    
    var isEmpty: Bool {
        return queue.count == 0
    }
    
    mutating func enqueue(_ node: T) {
        queue.append(data: node)
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
    
    mutating func removeAll() {
        queue.removeAll()
    }
}
