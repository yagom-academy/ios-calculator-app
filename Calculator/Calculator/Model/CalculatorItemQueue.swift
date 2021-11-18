//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by yeha on 2021/11/15.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    private(set) var items: [Element]
    
    init(_ item: [Element] = []) {
        self.items = item
    }
    
    mutating func enqueue(_ item: Element) {
        items.append(item)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        return items.isEmpty ? nil : items.removeFirst()
    }
    
    mutating func clean() {
        items.removeAll()
    }
}

protocol CalculateItem {}
