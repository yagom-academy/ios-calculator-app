//  CalculatorItemQueue.swift
//  Calculator
//  Created by LJ on 2022/09/19.

import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    var enqueueStack: [T] = []
    var dequeueStack: [T] = []

    mutating func enqueue(element: T) {
        enqueueStack.append(element)
    }

    mutating func dequeue() -> T? {
        reverseQueue()
        let value: T? = dequeueStack.popLast()
        return value
    }

    mutating func reverseQueue() {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
    }
}
