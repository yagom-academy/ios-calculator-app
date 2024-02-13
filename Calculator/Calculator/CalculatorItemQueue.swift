//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by H on 2/12/24.
//

import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue: CalculateItem {
    private var inbox: [Int] = []
    private var outbox: [Int] = []
    
    var size: Int {
        return inbox.count + outbox.count
    }
    
    var isEmpty: Int {
        if inbox.isEmpty && outbox.isEmpty {
            return 1
        } else {
            return 0
        }
    }
    
    mutating func push(_ data: Int) {
        inbox.append(data)
    }
    
    mutating func pop() -> Int {
        if self.isEmpty == 1 {
            return -1
        }
        
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        
        return outbox.removeLast()
    }
    
    mutating func front() -> Int {
        if self.isEmpty == 1 {
            return -1
        }
        
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        
        if let lastData = outbox.last {
            return lastData
        } else {
            return -1
        }
    }
    
    mutating func rear() -> Int {
        if self.isEmpty == 1 {
            return -1
        }
        
        if inbox.isEmpty {
            return outbox.first!
        }
        
        if let lastData = inbox.last {
            return lastData
        } else {
            return -1
        }
    }
}
