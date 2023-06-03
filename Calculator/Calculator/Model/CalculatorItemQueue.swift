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
        guard isEmpty == false else { return nil }
        if deQueueStack.isEmpty {
            deQueueStack = enQueueStack.reversed()
            enQueueStack.removeAll()
        }
        return deQueueStack.popLast()
    }
    
    func peek() -> String? {
        guard isEmpty == false else { return nil }
        if deQueueStack.count > 0 {
            return deQueueStack.last
        } else if enQueueStack.count > 0 {
            return enQueueStack.first
        }
        return nil
    }
    
    mutating func clear() {
        enQueueStack.removeAll()
        deQueueStack.removeAll()
    }
}
