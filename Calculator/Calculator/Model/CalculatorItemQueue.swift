//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 맹선아 on 2022/09/19.
//

import Foundation

struct CalculatorItemQueue: CalculateItem {
    var itemQueue: LinkedList = LinkedList<Int>()
    var index:Int = 0
    
    mutating func enqueue(_ data: Int) {
        itemQueue.append(data)
    }
    
    mutating func dequeue() {
        itemQueue.removeFirst()
    }
    
    mutating func clear() {
        itemQueue.head = nil
    }
}
