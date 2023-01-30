//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Christy Lee on 2023/01/24.
//

import Foundation

struct CalculatorItemQueue<T: CalculatorItem> {
    var data = [T]()
    init() {}
    
    var count: Int {
        return data.count
    }
    
    var isEmpty: Bool {
        return data.isEmpty
    }
    
    func peek() -> T? {
        return isEmpty ? nil : data.first
    }
    
    mutating func clearAll() {
        return data.removeAll()
    }
    
    mutating func enqueue(_ element: T) {
        data.append(element)
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : data.removeFirst()
    }
}
