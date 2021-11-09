//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 임지성 on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue<Element>: CalculateItem {
    private(set) var inbox = [Element]()
    var outbox = [Element]()
    
    var front: Element? {
        return outbox.last ?? inbox.first
    }
    
    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
    
    mutating func enqueue(_ element: Element) {
        inbox.append(element)
    }
    
    mutating func dequeue() -> Element? {
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
