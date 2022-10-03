//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by dragon on 2022/09/21.
//

struct CalculatorItemQueue<Item: CalculateItem> {
    private var calculateItemList = [Item]()
    
    var count: Int {
        return calculateItemList.count
    }
    
    var isEmpty: Bool {
        calculateItemList.isEmpty
    }
    
    init() {}
    
    mutating func enqueue(element: Item) {
        return calculateItemList.append(element)
    }
    
    mutating func dequeue() -> Item? {
        if calculateItemList.count > 0 {
            return calculateItemList.removeFirst()
        } else {
            return nil
        }
    }
    
    mutating func peek() -> Item? {
        return calculateItemList.first
    }
    
    mutating func clear() {
        return calculateItemList.removeAll()
    }
}
