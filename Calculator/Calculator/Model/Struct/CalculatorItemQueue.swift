//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by dragon on 2022/09/21.
//

public struct CalculatorItemQueue {
    private var calculatorItemArray = [String]()
    public var count: Int {
        return calculatorItemArray.count
    }
    
    public init() {}
    
    public mutating func enqueue(element: String) {
        return calculatorItemArray.append(element)
    }
    
    public mutating func dequeue() -> String? {
        if calculatorItemArray.count > 0 {
            return calculatorItemArray.removeFirst()
        } else {
            return nil
        }
    }
    
    public mutating func peek() -> String? {
        return calculatorItemArray.first
    }
    
    public mutating func clear() {
        return calculatorItemArray.removeAll()
    }
    
    public func isEmpty() -> Bool? {
        return calculatorItemArray.isEmpty
    }
}
