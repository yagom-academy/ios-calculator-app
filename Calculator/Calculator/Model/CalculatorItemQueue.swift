//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/10.
//

import Foundation

struct CalculatorItemQueue<T> {
    var list = LinkedList<T>()
    
    var isNotEmpty: Bool {
        return list.isNotEmpty
    }
    
    mutating func enqueue(_ item: T) {
        list.append(item)
    }
}
