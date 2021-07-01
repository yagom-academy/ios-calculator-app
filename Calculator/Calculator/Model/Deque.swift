//
//  Queue.swift
//  Calculator
//
//  Created by Marco, Charlotte on 2021/06/24.
//

import Foundation

struct Deque<T> {
    private var deque = Array<T>()
 
    mutating func removeAll() {
        deque.removeAll()
    }
    mutating func enqueueBehind(_ value: T) {
        deque.append(value)
    }
    mutating func dequeueInfront() -> T? {
        deque.isEmpty ? nil : deque.removeFirst()
    }
    mutating func enqueueInfront(_ value: T) {
        deque.insert(value, at: 0)
    }
    mutating func dequeueBehind() -> T? {
        return deque.popLast()
    }
}
