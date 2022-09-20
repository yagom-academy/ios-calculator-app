//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Gundy on 2022/09/19.
//

struct CalculatorItemQueue {
    var data: [CalculateItem] = []
    var count: Int {
        get {
            return data.count
        }
    }
    var capacity: Int {
        get {
            return data.capacity
        }
        set {
            data.reserveCapacity(newValue)
        }
    }
    var peek: CalculateItem? {
        get {
            guard data.first != nil else {
                return nil
            }
            return data.first
        }
    }
    var isEmpty: Bool {
        get {
            return data.isEmpty
        }
    }
    var isFull: Bool {
        get {
            return data.capacity == data.count
        }
    }
    
    init() {}
    
    mutating func enqueue(_ element: CalculateItem) {
        data.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> CalculateItem? {
        guard data.first != nil else {
            return nil
        }
        return data.removeFirst()
    }
    
    mutating func clear() {
        data = []
    }
    
    mutating func insert(_ element: CalculateItem, at index: Int) {
        data.insert(element, at: index)
    }
    
    mutating func remove(at index: Int) {
        data.remove(at: index)
    }
}
