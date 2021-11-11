//
//  Calculator.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/09.
//

import Foundation

struct CalculatorItemQueue {
    private var queueList: LinkedList = LinkedList()
    
    mutating func enqueue(item: CalculateItem) {
        queueList.append(data: item)
    }
    
    @discardableResult
    mutating func dequeue() -> CalculateItem? {
        return queueList.removeFrist()
    }

    mutating func clearQueue() {
        queueList.clear()
    }
}

extension CalculatorItemQueue {
    var queueListForTest: LinkedList {
        return self.queueList
    }
}
