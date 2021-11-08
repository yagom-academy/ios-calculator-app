//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 이아리 on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    private(set) var items = [T]()
    
    var count: Int {
        return items.count
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    mutating func enqueue(_ item: T) {
        items.append(item)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if items.isEmpty {
            return nil
        }
        return items.removeFirst()
    }
    
    mutating func clear() {
        items.removeAll()
    }
}
