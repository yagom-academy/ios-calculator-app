//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김성준 on 2023/01/24.
//

import Foundation

struct CalculatorItemQueue<T>  {
    private var queue: [T?] = []
    private var frontIndex: Int = 0
    
    public var size: Int {
        let count = queue.endIndex - frontIndex
        return count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard frontIndex <= size,
              let element = queue[frontIndex] else { return nil }

        queue[frontIndex] = nil
        frontIndex += 1

        return element
    }
    
    public func peek() -> T? {
        guard frontIndex <= size,
              let element = queue[frontIndex] else { return nil }
        
        return element
    }
    
    public mutating func clear() {
        queue = []
    }
}

