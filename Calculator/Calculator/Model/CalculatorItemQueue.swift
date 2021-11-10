//
//  CalcultaorItemQueue.swift
//  Calculator
//
//  Created by 1 on 2021/11/09.
//

import Foundation

class CalculatorItemQueue {
    var queue: [CalculateItem] = []
    
    func enqueue(_ item: Double) {
        queue.append(item)
    }
    
    func enqueue(_ item: Operator) {
        queue.append(item)
    }
    
    func dequeue() {
        guard queue.count != 0 else {
            return 
        }
        queue.removeFirst()
    }
    
    func removeAllItems() {
        queue.removeAll()
    }
}
