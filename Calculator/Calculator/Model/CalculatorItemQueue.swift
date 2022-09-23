//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by dragon on 2022/09/21.
//

public struct CalculatorItemQueue {
    private var calculatorItem = [String]()
    public var count: Int {
        return calculatorItem.count
    }
    
    public init() {}
    
    public mutating func enqueue(element: String) {
        return calculatorItem.append(element)
    }
    
    public mutating func dequeue() -> String? {
        if calculatorItem.count > 0 {
            return calculatorItem.removeFirst()
        } else {
            return nil
        }
    }
    
    public mutating func peek() -> String? {
        return calculatorItem.first
    }
    
    public mutating func clear() {
        return calculatorItem.removeAll()
    }
    
    public func isEmpty() -> Bool? {
        return calculatorItem.isEmpty
    }
}
