//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Dasan on 2023/05/30.
//

import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    private(set) var queue: LinkedList<T>
    
    init(queue: LinkedList<T> = LinkedList()) {
        self.queue = queue
    }
    
    var count: Int {
        return queue.count
    }
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(_ data: T) {
        queue.append(data)
    }
    
    mutating func dequeue() -> T? {
        if !isEmpty {
            return queue.removeFirst()
        }
        return nil
    }
}
