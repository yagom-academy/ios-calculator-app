//
//  CalculateItemQueue.swift
//  Calculator
//
//  Created by yeha on 2021/11/09.
//

import Foundation

struct CalculateItemQueue<T: Equatable> {
    private(set) var items: [T] = []
    
    mutating func enqueue(_ item: T) {
        items.append(item)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        return items.isEmpty ? nil : items.removeFirst()
    }
    
    mutating func clean() {
        items.removeAll()
    }
}
