//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김성준 on 2023/01/24.
//

import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    private(set) var queue: [T?] = []
    private(set) var frontIndex: Int = 0
    
    public var count: Int {
        let count = queue.endIndex - frontIndex
        return count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    @discardableResult 
    mutating func dequeue() -> T? {
        guard queue.isEmpty != true,
              frontIndex <= count,
              let element = queue[frontIndex] else { return nil }
       
        queue[frontIndex] = nil
        frontIndex += 1

        return element
    }
    
    func peek() -> T? {
        guard queue.isEmpty != true,
              frontIndex <= count,
              let element = queue[frontIndex] else { return nil }
        
        return element
    }
    
    mutating func clear() {
        queue = []
    }
    
}

