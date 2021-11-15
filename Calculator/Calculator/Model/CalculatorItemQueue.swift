//
//  Calculator.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/09.
//

import Foundation

struct CalculatorItemQueue {
    
    // MARK: property
    private var queueList: LinkedList = LinkedList()
    
}

// MARK: private method
extension CalculatorItemQueue {
    
    private mutating func enqueue(item: CalculateItem) {
        queueList.append(data: item)
    }
}

// MARK: internal method
extension CalculatorItemQueue {
    
    mutating func enqueue(number: Double) {
        enqueue(item: number)
    }
    
    mutating func enqueue(operatorItem: Operator) {
        enqueue(item: operatorItem)
    }

    @discardableResult
    mutating func dequeue() -> CalculateItem? {
        return queueList.removeFrist()
    }

    mutating func clearQueue() {
        queueList.clear()
    }
    
    func getQueueList() -> LinkedList {
        return queueList
    }
}
