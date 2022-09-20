//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by jin on 9/19/22.
//

import Foundation

final class CalculatorItemQueue {
    
    private var queue: LinkedList = LinkedList()
    
    func enqueue(item: String) {
        queue.append(item)
    }
    
    func dequeue() -> String? {
        return queue.pop()
    }
    
    func removeAll() {
        queue.removeAll()
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
}
