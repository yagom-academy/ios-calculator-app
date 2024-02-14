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
    
    var isEmpty: Bool {
        if inbox.isEmpty && outbox.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    mutating func push(_ data: Int) {
        inbox.append(data)
    }
    
    mutating func pop() -> Int? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        
        return outbox.popLast()
    }
    
    mutating func front() -> Int? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        
        return outbox.last
    }
    
    mutating func rear() -> Int? {
        if inbox.isEmpty {
            return outbox.first
        }
        
        return inbox.last
    }
}
