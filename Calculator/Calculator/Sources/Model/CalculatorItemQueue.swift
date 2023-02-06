//
//  Calculator - CalculatorItemQueue.swift
//  Created by Rhode, Songjun.
//  Copyright © yagom. All rights reserved.
//

struct CalculatorItemQueue<T: CalculateItem> {
    private(set) var data: [T]
    var isEmpty: Bool {
        return data.isEmpty
    }
    var count: Int {
        return data.count
    }
    
    init(_ data: [T] = []) {
        self.data = data
    }
    
    mutating func dequeue() -> T? {
        guard data.count > 0 else {
            return nil
        }
        return data.removeFirst()
    }
    
    func peek() -> T? {
        return data.first
    }
    
    mutating func enqueue(_ element: T) {
        data.append(element)
    }
    
    mutating func clear() {
        data.removeAll()
    }
}
