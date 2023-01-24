//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 박소연 on 2023/01/24.
//

import Foundation

struct CalculatorItemQueue<T> {
    var data: [T] = []
    var isEmpty: Bool {
        return data.isEmpty
    }
    var count: Int {
        return data.count
    }
    
    mutating func enqueue(_ element: T) {
        data.append(element)
    }
}
