//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by dragon on 2022/09/21.
//

struct CalculatorItemQueue<Item: CalculateItem> {
    private var calculateItemList = [Item]()
    public var count: Int {
        return calculateItemList.count
    }
    
    public init() {}
    
    public mutating func enqueue(element: Item) {
        return calculateItemList.append(element)
    }
    
    public mutating func dequeue() -> Item? {
        if calculateItemList.count > 0 {
            return calculateItemList.removeFirst()
        } else {
            return nil
        }
    }
    
    public mutating func peek() -> Item? {
        return calculateItemList.first
    }
    
    public mutating func clear() {
        return calculateItemList.removeAll()
    }
    
    public func isEmpty() -> Bool? {
        return calculateItemList.isEmpty
    }
}
