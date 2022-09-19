//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Kyo on 2022/09/19.
//

import Foundation

protocol CalculateItem {
    
}

class CalculatorItemQueue<T> {
    var queue: LinkedList<T>! = LinkedList()
    
    func enqueue(_ data: T) {
        queue.append(data: data)
    }
    
    func dequeue() -> T? {
        return queue.removeFirst()
    }
    
    func removeAll() {
        queue.removeAll()
    }
}
