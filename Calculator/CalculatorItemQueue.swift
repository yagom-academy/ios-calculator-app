//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Yetti on 2023/05/30.
//
protocol DoubleStackQueue {
    var isEmpty: Bool { get }
    mutating func enQueue(_ data: String)
    mutating func deQueue() -> String?
    func peek() -> String?
    mutating func clear()
}
protocol CalculateItem { }

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
        let frontElement = (enQueueStack == []) ? nil : enQueueStack.removeFirst()
        return frontElement
    }

    func peek() -> String? {
        let frontData = (enQueueStack == []) ? nil : enQueueStack[0]
        return frontData
    }
    
    mutating func clear() {
        enQueueStack.removeAll()
    }
}
