//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Marisol Mirim Kim on 2022/03/15.
//

import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    fileprivate var queue: Array<T?> = Array<T?>()
    fileprivate var head: Int = 0
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    public var count: Int {
        return queue.count
    }
    
    mutating public func enqueue(_ element: T) {
        queue.append(element)
    }
    
    mutating public func dequeue() -> T? {
        guard head < queue.count else {
            return nil
        }
        let element = queue[head]
        queue[head] = nil
        head += 1
        
        if head > 50 {
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
    
    func returnQueueForTest() -> Array<T?>{
        return queue
    }
}

protocol CalculateItem {
    
}

extension Double: CalculateItem {
    
}
