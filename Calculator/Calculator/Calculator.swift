//
//  Calculator.swift
//  Calculator
//
//  Created by Jinah Park on 2023/01/24.
//

import Foundation

protocol CalculateItem {
    
}

extension String: CalculateItem {
    
}

struct CalculatorItemQueue<T: CalculateItem> {
    var data = [T]()
    init() {}
    
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
    
    func isEmpty() -> Bool {
        return data.isEmpty
    }
    
    var count: Int {
        return data.count
    }
    
}
