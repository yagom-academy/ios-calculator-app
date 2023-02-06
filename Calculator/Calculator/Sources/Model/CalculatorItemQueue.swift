//
//  Calculator - CalculatorItemQueue.swift
//  Created by Rhode, Songjun.
//  Copyright © yagom. All rights reserved.
//

struct CalculatorItemQueue<T: CalculateItem> {
    private(set) var dequeueStack: [T] = []
    private(set) var enqueueStack: [T] = []

    var isEmpty: Bool {
        return dequeueStack.isEmpty && enqueueStack.isEmpty
    }

    init(_ data: [T] = []) {
        self.enqueueStack = data
    }
    
    mutating func enqueue(item: T) {
        enqueueStack.append(item)
    }

    @discardableResult
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}

