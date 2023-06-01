//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Yetti on 2023/05/30.
//
protocol DoubleStackQueue {
    associatedtype T
    var isEmpty: Bool { get }
    
    mutating func enQueue(_ element: T)
    mutating func deQueue() -> T?
    mutating func clear()
    func peek() -> T?
}
protocol CalculateItem { }

struct CalculatorItemQueue<T>: DoubleStackQueue, CalculateItem {
    var enQueueStack: [T] = []
    var deQueueStack: [T] = []
    
    var isEmpty: Bool {
        return enQueueStack.isEmpty && deQueueStack.isEmpty
    }
    
    mutating func enQueue(_ element: T) {
        enQueueStack.append(element)
    }
    
    mutating func deQueue() -> T? {
        return nil
    }

    func peek() -> T? {
        return nil
    }
    
    mutating func clear() {
    }
}
