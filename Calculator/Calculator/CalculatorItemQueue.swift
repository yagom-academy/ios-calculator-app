//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by jin on 9/19/22.
//

import Foundation

final class CalculatorItemQueue<T:CalculateItem> {
    
    private var queue: LinkedList = LinkedList<T>()
    
    func enqueue(item: T) {
        queue.append(item)
    }
    
    func dequeue() -> T? {
        return queue.pop()
    }
    
    func removeAll() {
        queue.removeAll()
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
}
