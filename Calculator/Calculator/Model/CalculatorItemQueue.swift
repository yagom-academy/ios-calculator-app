//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    var queue = LinkedList<T>()
    
    mutating func enQueue(_ data: T?) {
        queue.append(data)
    }
    
    mutating func deQueue() {
        queue.deQueue()
    }
    
    mutating func removeAll() {
        queue.removeAll()
    }
    
    mutating func returnQueue() -> Array<T> {
        return queue.returnQueue()
    }
}
