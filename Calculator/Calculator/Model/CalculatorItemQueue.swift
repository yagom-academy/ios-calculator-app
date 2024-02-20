//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by H on 2/20/24.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    private var inbox: [T] = []
    private var outbox: [T] = []
    
    var size: Int {
        return inbox.count + outbox.count
    }
    
    var isEmpty: Bool {
        if inbox.isEmpty && outbox.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    mutating func push(_ data: T) {
        inbox.append(data)
    }
    
    mutating func pop() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        
        return outbox.popLast()
    }
    
    mutating func front() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        
        return outbox.last
    }
    
    mutating func rear() -> T? {
        if inbox.isEmpty {
            return outbox.first
        }
        
        return inbox.last
    }
    
    func showQueue() -> [T] {
        return inbox + outbox
    }
}
