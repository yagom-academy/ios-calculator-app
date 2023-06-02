//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Dasan on 2023/05/30.
//

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
    
    var front: T? {
        return queue.first
    }
    
    var rear: T? {
        return queue.last
    }
    
    init(queue: LinkedList<T> = LinkedList()) {
        self.queue = queue
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
