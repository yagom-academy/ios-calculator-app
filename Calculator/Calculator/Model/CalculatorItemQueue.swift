//
//  CalcultaorItemQueue.swift
//  Calculator
//
//  Created by 1 on 2021/11/09.
//

import Foundation

class CalculatorItemQueue {
    private var queue: [CalculateItem] = []
    var testableQueue: [CalculateItem] {
        get {
            return queue
        }
    }
    
    func enqueue<Item: CalculateItem>(_ item: Item) {
        queue.append(item)
    }
    
    func dequeue() {
        guard queue.count > 0 else {
            return
        }
        queue.removeFirst()
    }
    
    func removeAllItems() {
        queue.removeAll()
    }
}
