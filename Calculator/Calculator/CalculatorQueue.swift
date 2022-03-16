//
//  CalculatorQueue.swift
//  Calculator
//
//  Created by Eddy on 2022/03/16.
//

import Foundation

public struct CalculatorQueue: CalculateItem {
    public var data = Array<String>()
    public init() {}
    
    public mutating func enqueOperation(_ element: String) -> [String] {
        data.append(element)
        return data
    }
    
    public mutating func dequeOperation() -> String? {
        return data.isEmpty ? nil : data.removeFirst()
    }
    
    public var countOperation: Int {
        return data.count
    }
    
    public mutating func clearAll() -> [String] {
        data.removeAll()
        data.append("0")
        return data
    }
    
    public mutating func removeLast() {
        data.removeLast()
    }
    
    public var capacity: Int {
        get {
            return data.capacity
        }
        set {
            data.reserveCapacity(newValue)
        }
    }
    
    public func isQueueFull() -> Bool {
        return data.count == data.capacity
    }
    
    public func isQueueEmpty() -> Bool {
        if data.isEmpty {
            return "큐가 비어있습니다"
        }
    }
    
    public func changeSign() {
        
    }
}
