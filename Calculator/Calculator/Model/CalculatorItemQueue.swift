//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by dragon on 2022/09/21.
//

public struct CalculatorItemQueue {
    private var data = [String]()
    public var count: Int {
        return data.count
    }
    
    public init() {}
    
    public mutating func enqueue(element: String) {
        return data.append(element)
    }
    
    public mutating func dequeue() -> String? {
        return data.removeFirst()
    }
    
    public mutating func peek() -> String? {
        return data.first
    }
    
    public mutating func clear() {
        return data.removeAll()
    }
    
    public func isEmpty() -> Bool? {
        return data.isEmpty
    }
}
