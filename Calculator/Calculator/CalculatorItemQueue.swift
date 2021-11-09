//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 임지성 on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue<Element>: CalculateItem {
    private(set) var inbox = [Element]()
    private(set) var outbox = [Element]()
    
    var front: Element? {
        return outbox.last ?? inbox.first
    }
    
    var count: Int {
        return outbox.count
    }
    
    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
    
    mutating func enqueue(_ element: Element) {
        inbox.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        if inbox.isEmpty && outbox.isEmpty {
            return nil
        }
        
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
            
        return outbox.removeLast()
    }
    
    mutating func clear() {
        inbox.removeAll()
        outbox.removeAll()
    }
}
