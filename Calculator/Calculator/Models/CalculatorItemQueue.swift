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
    private var queue: LinkedList<T>! = LinkedList()
    
    func front() -> T? {
        return queue.bringHead()
    }
    
    func last() -> T? {
        return queue.bringTail()
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
