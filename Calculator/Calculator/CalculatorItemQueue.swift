//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 송종환 on 2023/01/25.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    
    private(set) var enqueueStack: [T] = []
    private(set) var dequeueStack: [T] = []

    var currentStackCount: Int {
        return enqueueStack.count + dequeueStack.count
    }
        
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    mutating func enqueueItem(_ element: T) {
        enqueueStack.append(element)
    }
    // 1 + 2 - 3 * 4 + 5 =
    @discardableResult
    mutating func dequeueItem() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}
