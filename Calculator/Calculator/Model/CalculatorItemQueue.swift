//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 맹선아 on 2022/09/19.
//

import Foundation

struct CalculatorItemQueue: CalculateItem {
    var itemQueue: LinkedList = LinkedList()
    
    mutating func enqueue(_ data: String) {
        itemQueue.append(data)
    }
    
    mutating func dequeue() {
        itemQueue.removeFirst()
    }
    
    func confirmFirst() -> String? {
        return itemQueue.head?.data
    }
    
    mutating func clear() {
        itemQueue.head = nil
    }
}
