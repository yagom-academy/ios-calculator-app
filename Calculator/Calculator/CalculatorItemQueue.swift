//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 이원빈 on 2022/05/16.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    var array = Array<T>()
    var isEmpty: Bool {
        return array.isEmpty
    }
    var peek: T? {
        return array.first
    }
    
    mutating func enQueue(_ element: T) {
        array.append(element)
    }
    
    mutating func deQueue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}



