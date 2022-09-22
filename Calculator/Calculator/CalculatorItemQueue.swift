//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Gundy on 2022/09/19.
//

struct CalculatorItemQueue<DataType: CalculateItem> {
    private var data: [DataType] = []
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
    var peek: DataType? {
        get {
            guard data.first != nil else {
                return nil
            }
            return data.first
        }
    }
    var last: DataType? {
        get {
            guard data.last != nil else {
                return nil
            }
            return data.last
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
    
    mutating func enqueue(_ element: DataType) {
        data.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> DataType? {
        return data.popFirst()
    }
    
    mutating func clear() {
        data = []
    }
    
    mutating func insert(_ element: DataType, at index: Int) {
        data.insert(element, at: index)
    }
    
    mutating func remove(at index: Int) {
        data.remove(at: index)
    }
}
