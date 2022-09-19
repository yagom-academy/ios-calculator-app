//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by jin on 9/19/22.
//

import Foundation

class CalculatorItemQueue {
    var queue: LinkedList = LinkedList()
    
    func enqueue(item: String) {
        queue.append(item)
    }
    
    func dequeue() -> String? {
        return queue.pop()
    }
    
    func removeAll() {
        queue.removeAll()
    }
}
