//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Yetti on 2023/05/30.

struct CalculatorItemQueue: DoubleStackQueue, CalculateItem {
    private(set) var enQueueStack: [String] = []
    private(set) var deQueueStack: [String] = []
    
    var isEmpty: Bool {
        return enQueueStack.isEmpty && deQueueStack.isEmpty
    }
    
    mutating func enQueue(_ element: String) {
        enQueueStack.append(element)
    }
    
    mutating func deQueue() -> String? {
        if deQueueStack.isEmpty {
            deQueueStack = enQueueStack.reversed()
            enQueueStack.removeAll()
        }
        return deQueueStack.popLast()
    }
    
    func peek() -> String? {
        if deQueueStack.count >= 1 {
            return deQueueStack[deQueueStack.count - 1]
        } else if enQueueStack.count >= 1 {
            return enQueueStack[0]
        }
        return nil
    }
    
    mutating func clear() {
        enQueueStack.removeAll()
        deQueueStack.removeAll()
    }
}
