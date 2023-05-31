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
    mutating func clear()
    func peek() -> String?
}
protocol CalculateItem { }

struct CalculatorItemQueue: DoubleStackQueue, CalculateItem {
    var enQueueStack: [String] = []
    var deQueueStack: [String] = []
    
    var isEmpty: Bool {
        return enQueueStack.isEmpty && deQueueStack.isEmpty
    }
    
    mutating func enQueue(_ element: String) {
        
    }
    
    mutating func deQueue() -> String? {
        return "a"
    }

    func peek() -> String? {
        return "b"
    }
    
    mutating func clear() {
    }
}
