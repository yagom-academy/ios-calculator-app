//
//  CalculateItemQueue.swift
//  Calculator
//
//  Created by yeha on 2021/11/09.
//

import Foundation

struct CalculateItemQueue<Element: CalculateItem> {
    private(set) var items: [Element] = []
    
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
