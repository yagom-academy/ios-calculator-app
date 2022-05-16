//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/16.
//

import Foundation

class CalculatorItemQueue: CalculatorItem {
    var enqueue: [String]
    var dequeue: [String]
    
    var count: Int {
        return enqueue.count + dequeue.count
    }
    
    init() {
        self.enqueue = []
        self.dequeue = []
    }
    
    func enQueue(_ input: String) {
        self.enqueue.append(input)
    }
    
    func deQueue() -> String? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
}
