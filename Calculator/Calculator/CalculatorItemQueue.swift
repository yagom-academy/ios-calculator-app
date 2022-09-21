//  CalculatorItemQueue.swift
//  Calculator
//  Created by LJ on 2022/09/19.

import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    var queue: [T] = []
    var resultQueue: [T] = []

    mutating func enqueue(element: T) {
        return queue.append(element)
    }
    mutating func dequeue() -> [T] {
        queue.removeFirst()
        return queue
    }
}


