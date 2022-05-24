//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Kay on 2022/05/17.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    private var queue: [T?] = []
    private var head: Int = 0
    
    init(queue: [T?] = [], head: Int = 0) {
        self.queue = queue
        self.head = head
    }
    
    var count: Int {
        return queue.count - head
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    var front: T? {
        if count == 0 {
            return nil
        } else {
            guard let element = queue[head] else { return nil }
            return element
        }
    }
    
    var rear: T? {
        if count == 0 {
            return nil
        } else {
            guard let lastElement = queue.last else { return nil }
            return lastElement
        }
    }
    
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    mutating func dequeue() -> T? {
        if count == 0 {
            return nil
        } else {
            defer {
                head += 1
            }
            return queue[head]
        }
    }
    
    mutating func clear() {
        queue.removeAll()
    }
}
