//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 전민수 on 2022/05/16.
//

import Foundation

struct CalculatorItemQueue<Element> {
    private(set) var enqueueStack: [Element] = []
    private(set) var dequeueStack: [Element] = []
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    var peek: Element? {
        return dequeueStack.isEmpty ? enqueueStack.first : dequeueStack.last
    }
    
    mutating func enqueue(element: Element) -> [Element] {
        enqueueStack.append(element)
        return enqueueStack
    }
    
    mutating func dequeue() -> Element? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
    
    mutating func clearQueue() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
    }
}
