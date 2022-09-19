//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Gundy on 2022/09/19.
//

struct CalculatorItemQueue<T>: CalculateItem {
    var data: [T] = []
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
    
    init() {}
    
    mutating func enqueue(_ element: T) {
        data.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard let element = data.first else {
            return nil
        }
        data.removeFirst()
        return element
    }
    
    func peek() -> T? {
        guard let element = data.first else {
            return nil
        }
        return element
    }
    
    mutating func clear() {
        data = []
    }
    
    func isEmpty() -> Bool {
        return data.isEmpty
    }
    
    func isFull() -> Bool {
        return data.capacity == data.count
    }
    
    mutating func insert(_ element: T, at index: Int) {
        data.insert(element, at: index)
    }
    
    mutating func removeAtIndex(_ index: Int) {
        
    }
}
