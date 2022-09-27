//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 서현웅 on 2022/09/20.
//

import Foundation

struct CalculatorItemQueue<T> {
    private(set) var queue: [T] = []
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return queue.removeFirst()
        }
    }
    
    mutating func clear() {
        queue.removeAll()
    }
}
