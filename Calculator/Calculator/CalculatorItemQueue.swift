//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 이원빈 on 2022/05/16.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    var deQueueStack = Array<T>()
    var enQueueStack = Array<T>()
    var isEmpty: Bool {
        return deQueueStack.isEmpty && enQueueStack.isEmpty
    }
    var peek: T? {
        return !deQueueStack.isEmpty ? deQueueStack.last : enQueueStack.first
    }
    var currentArray: [T] {
        return deQueueStack.reversed() + enQueueStack
    }
    
    mutating func enQueue(_ element: T) {
        enQueueStack.append(element)
    }
    
    mutating func deQueue() -> T? {
        if deQueueStack.isEmpty {
            deQueueStack = enQueueStack.reversed()
            enQueueStack.removeAll()
        }
        return deQueueStack.popLast()
    }
}



