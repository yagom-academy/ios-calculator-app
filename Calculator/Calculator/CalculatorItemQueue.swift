//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Rowan on 2023/01/24.
//

import Foundation

struct CalculatorItemQueue<Element> {
    var queue: Array<Element?> = []
    var head: Int = 0
    var result: Double = 0
    
    mutating func enqueue(_ element: Element) {
        queue.append(element)
    }
    
    mutating func dequeue() -> Element? {
        guard queue.count != 0 else {
            return nil
        }
        
        let element = queue.removeFirst()
        
        return element
    }
}
