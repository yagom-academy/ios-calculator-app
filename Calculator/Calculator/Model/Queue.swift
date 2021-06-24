//
//  Queue.swift
//  Calculator
//
//  Created by Yongwoo Marco on 2021/06/24.
//

import Foundation

struct Queue<T> {
    private var queue = Array<T>()
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(_ value: T) {
        queue.append(value)
    }
    mutating func dequeue() -> T {
        return queue.removeFirst()
    }
}
