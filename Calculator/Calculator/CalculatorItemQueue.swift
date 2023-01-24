//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김성준 on 2023/01/24.
//

import Foundation



struct CalculatorItemQueue<T: CalculateItem> {
    
    private var queue: [T?] = []
    private var frontIndex: Int = 0
    
    public var count: Int {
        let count = queue.endIndex - frontIndex
        return count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    @discardableResult 
    public mutating func dequeue() -> T? {
        guard queue.isEmpty != true,
              frontIndex <= count,
              let element = queue[frontIndex] else { return nil }
        //호오~? 왜그럴까 ? 이 말썽꾸러기
        queue[frontIndex] = nil
        frontIndex += 1

        return element
    }
    
    public func peek() -> T? {
        guard frontIndex <= count,
              let element = queue[frontIndex] else { return nil }
        
        return element
    }
    
    public mutating func clear() {
        queue = []
    }
    
}

