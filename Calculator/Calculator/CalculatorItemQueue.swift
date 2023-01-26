//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Christy Lee on 2023/01/24.
//

import Foundation

struct CalculatorItemQueue<T> {
    var data = [T] ()
    init() {}
    
    var count: Int {
        return data.count
    }
    
    func isEmpty() -> Bool {
        return data.isEmpty
    }
    
    func peek() -> T? {
        return isEmpty() ? nil : data.first
    }
    
    mutating func clearAll() {
        return data.removeAll()
    }
    
    mutating func enqueue(_ element: T) {
        data.append(element)
    }
}
