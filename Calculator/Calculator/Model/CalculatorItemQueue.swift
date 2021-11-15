//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    var linkedList = LinkedList<T>()
    
    var isEmpty: Bool {
        return linkedList.isEmpty()
    }
    
    mutating func enQueue(_ data: T?) {
        linkedList.append(data)
    }
    
    @discardableResult
    mutating func deQueue() throws -> T {
        guard let dataOfDeQueue = linkedList.removeFirst() else {
            throw QueueError.deQueueFailed
        }
        return dataOfDeQueue
    }
    
    mutating func removeAll() {
        linkedList.removeAll()
    }
    
    mutating func returnQueue() -> Array<T> {
        return linkedList.returnList()
    }
}
