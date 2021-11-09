//
//  CalcultaorItemQueue.swift
//  Calculator
//
//  Created by 1 on 2021/11/09.
//

import Foundation

protocol CalculateItem {
    
}

enum Operator: CalculateItem {
    case plus, minus, multiply, divide, equal
}

struct Number: CalculateItem {
    let num: Double
}

struct CalculatorItemQueue {
    var queue: [CalculateItem] = []
    
    mutating func enqueue(_ item: Double) {
        let num = Number(num: item)
        queue.append(num)
    }
    
    mutating func enqueue(_ item: Operator) {
        queue.append(item)
    }
    
    mutating func dequeue() {
        guard queue.count != 0 else {
            return 
        }
       queue.removeFirst()
    }
    
    mutating func removeAllItems() {
        queue.removeAll()
    }
}
