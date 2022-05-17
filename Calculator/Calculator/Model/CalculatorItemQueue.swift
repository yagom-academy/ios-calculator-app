//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Kay on 2022/05/17.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem{
    private var queue: [T?] = []
    private var head: Int = 0
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public var front: T? {
        if queue.count == 0 {
            return nil
        } else {
            guard let element = queue[head] else { return nil}
            return element
        }
    }
    
    public var rear: T? {
        if queue.count == 0 {
            return nil
        } else {
            guard let element = queue[queue.count - 1] else { return nil}
            return element
        }
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if queue.count == 0 {
            return nil
        } else {
            guard let element = queue[head] else { return nil }
            queue.removeFirst(head)
            head += 1
            return element
        }
    }
    
    public mutating func clear() {
        queue.removeAll()
    }
}
