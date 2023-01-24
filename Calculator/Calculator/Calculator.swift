//
//  Calculator.swift
//  Calculator
//
//  Created by Jinah Park on 2023/01/24.
//

import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue<T> {
    var data = [T]()
    init() {}
    
    mutating func dequeue() -> T? {
        return nil
    }
    
    func peek() -> T? {
        return nil
    }
    
    mutating func enqueue(_ element: T) {
    }
    
    mutating func clear() {
    }
    
    func isEmpty() -> Bool {
        return true
    }
    
    var count: Int {
        return 0
    }
    
}
