//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Dasan on 2023/05/30.
//

struct CalculatorItemQueue<T: CalculateItem> {
    private var queue: LinkedList<T> = LinkedList()
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    var first: T? {
        return queue.first
    }
    
    var last: T? {
        return queue.last
    }
    
    mutating func enqueue(_ data: T) {
        queue.append(data)
    }
    
    mutating func dequeue() -> T? {
        return queue.removeFirst()
    }
}
