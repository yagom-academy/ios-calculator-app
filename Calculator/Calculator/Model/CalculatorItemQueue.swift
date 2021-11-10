//
//  Calculator.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/09.
//

import Foundation

struct CalculatorItemQueue {
    private var queueList: LinkedList = LinkedList()
    
    mutating func enqueue(item: CalculateItem?) {
        guard let item = item else {
            print("noValueToEnqueue")
            return
        }
        queueList.append(data: item)
    }
    
    mutating func dequeue() -> CalculateItem? {
        return queueList.isEmpty ? nil : queueList.removeFrist()
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
