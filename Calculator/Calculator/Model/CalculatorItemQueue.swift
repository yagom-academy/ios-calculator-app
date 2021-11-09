//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/09.
//

import Foundation

struct CalculatorItemQueue<T: CalculatorItem> {
    private var items: LinkedList<T>
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    init() {
        items = LinkedList<T>()
    }
    
    mutating func enqueue(_ item: T) {
        items.append(item)
    }
    
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        }
        return items.pop()
    }
    
    mutating func removeLast() -> T? {
        if isEmpty {
            return nil
        }
        return items.removeLast()
    }
}

extension CalculatorItemQueue: CustomStringConvertible {
    var description: String {
        return items.description
    }
}

