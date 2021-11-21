//
//  CalculateItemQueue.swift
//  Calculator
//
//  Created by 권나영 on 2021/11/09.
//

import Foundation

struct CalculateItemQueue<T: CalculateItem> {
    private var enqueueStack: [T] = []
    private var dequeueStack: [T] = []
    
    var isEmpty: Bool {
        enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    init(enqueueStack: [T] = []) {
        self.enqueueStack = enqueueStack
    }
    
    mutating func enqueue(element: T) {
        enqueueStack.append(element)
    }
    
    mutating func dequeue() throws -> T {
        if enqueueStack.isEmpty, dequeueStack.isEmpty {
            throw CalculatorError.isEmptyStack
        }
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.removeLast()
    }
}

extension Double: CalculateItem { }
