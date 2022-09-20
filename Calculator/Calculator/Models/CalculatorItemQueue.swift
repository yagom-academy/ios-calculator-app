//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Kyo on 2022/09/19.
//

import Foundation

protocol CalculateItem {
    
}

extension String: CalculateItem {
    
}

final class CalculatorItemQueue<T: CalculateItem> {
    var queue: LinkedList<T>! = LinkedList()
    
    func front() -> T? {
        return queue.head?.data
    }
    
    func last() -> T? {
        return queue.tail?.data
    }
    
    func enqueue(_ data: T) {
        queue.append(data: data)
    }
    
    func dequeue() -> T? {
        return queue.removeFirst()
    }
    
    func count() -> Int {
        return queue.count
    }
    
    func removeAll() {
        queue.removeAll()
    }
}
