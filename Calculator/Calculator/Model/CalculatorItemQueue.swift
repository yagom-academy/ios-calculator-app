//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by EtialMoon on 2023/05/29.
//

struct CalculatorItemQueue {
    private var queue: [String] = []
    
    func getQueue() -> [String] {
        return queue
    }
    
    mutating func enqueue(_ element: String) {
        queue.append(element)
    }
}
