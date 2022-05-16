//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/16.
//

import Foundation

class CalculatorItemQueue {
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
    
    func deQueue() {
        
    }
}
