//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by dragon on 2022/09/21.
//

public struct CalculatorItemQueue<T: StringProtocol> {
    private var calculatorItemList = [String]()
    public var count: Int {
        return calculatorItemList.count
    }
    
    public init() {}
    
    public mutating func enqueue(element: String) {
        return calculatorItemList.append(element)
    }
    
    public mutating func dequeue() -> String? {
        if calculatorItemList.count > 0 {
            return calculatorItemList.removeFirst()
        } else {
            return nil
        }
    }
    
    public mutating func peek() -> String? {
        return calculatorItemList.first
    }
    
    public mutating func clear() {
        return calculatorItemList.removeAll()
    }
    
    public func isEmpty() -> Bool? {
        return calculatorItemList.isEmpty
    }
}
