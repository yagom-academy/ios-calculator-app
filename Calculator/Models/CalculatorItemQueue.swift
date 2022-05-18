//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 재재 on 2022/05/18.
//

import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    
    private var firstQueue: [T] = []
    private var secondQueue: [T] = []
    
    var count: Int {
        return firstQueue.count + secondQueue.count
    }
    
    var isEmpty: Bool {
        return firstQueue.isEmpty && secondQueue.isEmpty
    }
    
    var peek: T? {
        return firstQueue.isEmpty ? secondQueue.last : firstQueue.first
    }
    
    mutating func enqueue(_ element: T) {
        firstQueue.append(element)
    }
    
    mutating func dequeue() -> T? {
        if secondQueue.isEmpty {
            secondQueue = firstQueue.reversed()
            firstQueue.removeAll()
        }
        return secondQueue.popLast()
    }
}

extension Int: CalculateItem {
    
}
