//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 맹선아 on 2022/09/19.
//

import Foundation

struct CalculatorItemQueue {
    var itemQueue: [(arithmetics: String, number: Int)?] = []
    var index:Int = 0
    
    mutating func enqueue(_ data: (String, Int)) {
        itemQueue.append(data)
    }
    
    mutating func dequeue() -> (String, Int)? {
        guard let data = itemQueue[index] else {
            return nil
        }
        
        itemQueue[index] = nil
        index += 1
        
        return data
    }
    
    mutating func clear() {
        itemQueue.removeAll()
        index = 0
    }
}
