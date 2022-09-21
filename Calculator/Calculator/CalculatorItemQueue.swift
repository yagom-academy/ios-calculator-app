//  CalculatorItemQueue.swift
//  Calculator
//  Created by LJ on 2022/09/19.

import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    var rightStack: [T] = []
    var leftStack: [T] = []

    mutating func enqueue(element: T) {
        return rightStack.append(element)
    }

    mutating func dequeue() -> T? {
        reverseQueue()
        let value: T? = leftStack.popLast()
        return value
    }
    
    mutating func reverseQueue() {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
    }
}
