//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Dasan on 2023/05/30.
//

import Foundation

protocol CalculateItem { }

extension Int:CalculateItem { }

extension String:CalculateItem { }

extension Double:CalculateItem { }

struct CalculatorItemQueue<T: CalculateItem> {
    var queue: [T] = [T]()
    //var queue: LinkedList = LinkedList<T>()
    
    var count: Int {
        return queue.count
    }
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(_ data: T) {
        queue.append(data)
    }
    
    mutating func dequeue() -> T? {
        if !isEmpty {
            return queue.removeFirst()
        }
        return nil
    }
}
