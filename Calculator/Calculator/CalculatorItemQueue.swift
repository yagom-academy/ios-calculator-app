//
//  Calculator.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/09.
//

import Foundation

struct CalculatorItemQueue {
    private(set) var queueList: LinkedList = LinkedList()
    
    mutating func enqueue(item: CalcultorItem?) {
        guard let item = item else {
            return
        }
        queueList.append(data: item)
    }
    
    mutating func dequeue() -> CalcultorItem? {
        if queueList.isEmpty {
            return nil
        }
        let removedItem = queueList.removeFrist()

        return removedItem
    }

    mutating func clearQueue() {
        queueList.clear()
    }
}


