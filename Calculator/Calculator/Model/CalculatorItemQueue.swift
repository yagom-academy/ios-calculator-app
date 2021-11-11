//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    var queue = LinkedList<T>()
    
    var isEmpty: Bool {
        return queue.isEmpty()
    }
    
    mutating func enQueue(_ data: T?) {
        queue.append(data)
    }
    
    @discardableResult
    mutating func deQueue() throws -> T {
        return try queue.deQueue()
    }
    
    mutating func removeAll() {
        queue.removeAll()
    }
    
    mutating func returnQueue() -> Array<T> {
        return queue.returnList()
    }
}
