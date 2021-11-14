//
//  CalculatorItem.swift
//  Calculator
//
//  Created by Seul Mac on 2021/11/09.
//

import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue<Element: CalculateItem> {

    private(set) var inbox: [Element]
    private(set) var outbox: [Element]
    
    mutating func enqueue(_ item: Element) {
        inbox.append(item)
    }
    
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
    
    init(inbox: [Element] = [], outbox: [Element] = []) {
        self.inbox = inbox
        self.outbox = outbox
    }
    
}

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
}
