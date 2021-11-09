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

class CalculatorItemQueue {
    var queue: [CalculateItem] = []
    
    func enqueue(_ item: Double) {
        let num = Number(num: item)
        queue.append(num)
    }
    
    func enqueue(_ item: Operator) {
        queue.append(item)
    }
    
    func dequeue() {
        guard queue.count != 0 else {
            return 
        }
        queue.removeFirst()
    }
    
    func removeAllItems() {
        queue.removeAll()
    }
}
