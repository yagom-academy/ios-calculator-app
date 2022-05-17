//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 이예은 on 2022/05/17.
//

import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    let queue = LinkedList<T>()
    
    mutating func enqueue(data: T) {
        queue.append(data: data)
    }
    
    mutating func dequeue() -> T? {
        queue.removeFirst()
    }
}
