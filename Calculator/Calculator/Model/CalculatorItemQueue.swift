//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by dragon on 2022/09/21.
//

public struct CalculatorItemQueue<T> {
    private var data = [T]()
    
    public init() {}
    
    public mutating func dequeue() -> T? {
        return data.removeFirst()
    }
    
    public mutating func peek() -> T? {
        return data.first
    }
    
    public mutating func enqueue(element: T) {
        return data.append(element)
    }
    
    public mutating func clear() {
        return data.removeAll()
    }
    
    public var count: Int {
        return data.count
    }
    
    public func isEmpty() -> Bool? {
        return data.isEmpty
    }
}
