//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Yetti on 2023/05/30.

struct CalculatorItemQueue: DoubleStackQueue, CalculateItem {
    var enQueueStack: [String] = []
    var deQueueStack: [String] = []
    
    var isEmpty: Bool {
        return enQueueStack.isEmpty && deQueueStack.isEmpty
    }
    
    mutating func enQueue(_ element: String) {
        enQueueStack.append(element)
    }
    
    mutating func deQueue() -> String? {
        deQueueStack = enQueueStack.reversed()
        let deQueueElement = deQueueStack.popLast()
        enQueueStack = deQueueStack.reversed()
        return deQueueElement
    }

    func peek() -> String? {
        return enQueueStack == [] ? nil : enQueueStack[0]
    }
    
    mutating func clear() {
        enQueueStack.removeAll()
        deQueueStack.removeAll()
    }
}
