//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/10.
//

import Foundation

struct CalculatorItemQueue<T> {
    private var list = LinkedList<T>()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var isNotEmpty: Bool {
        return list.isNotEmpty
    }
    
    mutating func enqueue(_ item: T) {
        list.append(item)
    }
    
    @discardableResult
    mutating func dequeue() throws -> T {
        guard let headValue = list.retrieveHeadValue() else {
            throw CalculateItemQueueError.queueIsEmpty
        }
        return headValue
    }
    
    mutating func removeAll() {
        list.removeAll()
    }
}

extension CalculatorItemQueue {
    init(elements: [T]) {
        for element in elements {
            enqueue(element)
        }
    }
}
